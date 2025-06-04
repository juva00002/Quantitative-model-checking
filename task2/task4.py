import os
import json
import argparse
from typing import Dict, Any, Union, Set
import sparce_matrix 
from task3 import next_operator, bounded_until, until_operator

class DTMC:
    def __init__(self, states_file: str, transitions_file: str, labels_file: str):
        self.states = self._load_states(states_file)
        self.transitions = sparce_matrix.SparseMatrix(transitions_file)  
        self.labels = self._load_labels(labels_file)
        self.initial_state = self._find_initial_state()

    def _load_states(self, file_path: str) -> Dict[int, Dict[str, int]]:
        states = {}
        full_path = os.path.join(os.path.dirname(__file__), file_path)
        print(f"Loading states from {full_path}")

        with open(full_path, 'r') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if not line:
                    continue

                try:
                    parts = line.split(':', 1)
                    if len(parts) != 2:
                        continue

                    idx_str, values_str = parts
                    idx = int(idx_str.strip())

                    values_str = values_str.strip()
                    if not (values_str.startswith('(') and values_str.endswith(')')):
                        print(f"Warning: Skipping line {line_num} with invalid format: {line}")
                        continue

                    values = values_str[1:-1].split(',')
                    if len(values) != 3:
                        print(f"Warning: Skipping line {line_num} - expected 3 values, got {len(values)}")
                        continue

                    states[idx] = {
                        'square': int(values[0]),
                        'wait': int(values[1]),
                        'dice': int(values[2])
                    }

                except ValueError as e:
                    print(f"Warning: Couldn't parse line {line_num}: {line} - {str(e)}")
                    continue

        return states

    def _load_labels(self, file_path: str) -> Dict[str, Any]:
        """
        Parse labels file into two dictionaries:
        1. label_names: {id: "name"} (e.g., {0: "init", 1: "deadlock"})
        2. state_labels: {state_idx: set(label_ids)} (e.g., {0: {0}, 448: {2,3}})
        """
        label_names = {}
        state_labels = {}
        full_path = os.path.join(os.path.dirname(__file__), file_path)
        with open(full_path, 'r') as f:
            first_line = f.readline().strip()
            for item in first_line.split():
                if '=' in item:
                    label_id, label_name = item.split('=')
                    label_names[int(label_id.strip())] = label_name.strip('"')

            for line in f:
                line = line.strip()
                if not line or ':' not in line:
                    continue

                state_str, labels_str = line.split(':')
                state_idx = int(state_str.strip())
                label_ids = set(map(int, labels_str.strip().split()))
                state_labels[state_idx] = label_ids

        return {
            'names': label_names,
            'assignments': state_labels
        }

    def _find_initial_state(self) -> int:
        for state_idx, label_ids in self.labels['assignments'].items():
            if 0 in label_ids:
                print(f"Initial state found: {state_idx} (labeled 'init')")
                return state_idx
        print("No 'init' label found, falling back to state 0")
        return 0

    def get_state_labels(self, state_idx: int) -> list:
        label_ids = self.labels['assignments'].get(state_idx, set())
        return [self.labels['names'][lid] for lid in label_ids if lid in self.labels['names']]

    def _find_satisfying_states(self, formula: Dict) -> Set[int]:
        """Find all states satisfying the given formula"""
        if formula["type"] == "atomic":
            states = set()
            for idx, state in self.states.items():
                if state[formula["variable"]] == formula["value"]:
                    states.add(idx)
            print(f"States satisfying {formula['variable']} == {formula['value']}: {states}")
            return states
        elif formula["type"] == "not":
            all_states = set(self.states.keys())
            negated_states = self._find_satisfying_states(formula["formula"])
            result = all_states - negated_states
            print(f"States satisfying NOT ({formula['formula']}): {result}")
            return result
        elif formula["type"] == "and":
            left_states = self._find_satisfying_states(formula["left"])
            right_states = self._find_satisfying_states(formula["right"])
            result = left_states & right_states
            print(f"States satisfying {formula['left']} AND {formula['right']}: {result}")
            return result
        else:
            raise ValueError(f"Unsupported formula type: {formula['type']}")

    def _prob_next(self, set_B: Set[int], state_idx: int) -> float:
        """Calculate probability for Next operator (X B) using P2.3 function"""
        print(f"Computing Next probability for state {state_idx} with set_B: {set_B}")
        p_vector = next_operator(set_B, self.transitions)
        print(f"Next probability vector: {p_vector}")
        return p_vector[state_idx]

    def _prob_bounded_until(self, set_A: Set[int], set_B: Set[int], n: int, state_idx: int) -> float:
        """Calculate probability for bounded until (φ1 U≤n φ2) using P2.3 function"""
        print(f"Computing bounded until probability for state {state_idx} with set_A: {set_A}, set_B: {set_B}, n: {n}")
        prob = bounded_until(set_A, set_B, self.transitions, state_idx, n)
        print(f"Bounded until probability for state {state_idx}: {prob}")
        return prob

    def _prob_unbounded_until(self, set_A: Set[int], set_B: Set[int], state_idx: int, precision: float = 1e-6) -> float:
        """Calculate probability for unbounded until (φ1 U φ2) using P2.3 function"""
        print(f"Computing unbounded until probability for state {state_idx} with set_A: {set_A}, set_B: {set_B}, precision: {precision}")
        p_vector = until_operator(set_A, set_B, self.transitions, p=precision)
        print(f"Unbounded until probability vector: {p_vector}")
        return p_vector[state_idx]

    def _evaluate_path_formula(self, formula: Dict, state_idx: int) -> float:
        """Evaluate path formulas and return probability"""
        print(f"Evaluating path formula: {formula} for state {state_idx}")
        if formula["type"] == "next":
            set_B = self._find_satisfying_states(formula["formula"])
            print(f"Set B for Next: {set_B}")
            return self._prob_next(set_B, state_idx)
        elif formula["type"] == "bounded_until":
            set_A = self._find_satisfying_states(formula["left"])
            set_B = self._find_satisfying_states(formula["right"])
            n = formula["bound"]
            print(f"Set A for bounded until: {set_A}, Set B: {set_B}, Bound: {n}")
            return self._prob_bounded_until(set_A, set_B, n, state_idx)
        elif formula["type"] == "until":
            set_A = self._find_satisfying_states(formula["left"])
            set_B = self._find_satisfying_states(formula["right"])
            print(f"Set A for unbounded until: {set_A}, Set B: {set_B}")
            return self._prob_unbounded_until(set_A, set_B, state_idx)
        else:
            raise ValueError(f"Unsupported path formula type: {formula['type']}")

    def check_formula(self, json_file: str) -> Union[bool, float]:
        """Evaluate the PCTL formula and return result (boolean or probability)"""
        parser = PCTLFormulaParser(self)
        formula = parser.parse_formula(json_file)
        print(f"Parsed formula: {formula}")
        initial_state = self._find_initial_state()
        print(f"Initial state for evaluation: {initial_state}")

        if formula["type"] == "probability":
            prob = self._evaluate_path_formula(formula["formula"], initial_state)
            print(f"Computed probability: {prob}, Interval: {formula['interval']}")
            result = formula["interval"][0] <= prob <= formula["interval"][1]
            print(f"Probability check result: {result}")
            return result
        elif formula["type"] in ["next", "bounded_until", "until"]:
            prob = self._evaluate_path_formula(formula, initial_state)
            print(f"Computed probability for path formula: {prob}")
            return prob
        else:
            result = initial_state in self._find_satisfying_states(formula)
            print(f"State formula result: {result}")
            return result

class PCTLFormulaParser:
    """Parses PCTL formulas from JSON format"""
    def __init__(self, dtmc: DTMC):
        self.dtmc = dtmc

    def parse_formula(self, json_file: str) -> Dict[str, Any]:
        """Main entry point - loads and parses JSON formula file"""
        full_path = os.path.join(os.path.dirname(__file__), json_file)
        print(f"Loading formula from: {full_path}")
        with open(full_path, 'r') as f:
            formula = json.load(f)
            print(f"Raw JSON formula loaded: {formula}")
        return self._parse_node(formula)

    def _parse_node(self, node: Dict) -> Dict:
        """Recursively parse formula nodes"""
        op = node["op"].strip().lower()
        print(f"Parsing node with operator: {op}")

        if op == "ap":
            result = {
                "type": "atomic",
                "variable": node["var"],
                "operator": "==",
                "value": node["val"]
            }
            print(f"Parsed atomic proposition: {result}")
            return result
        elif op == "not":
            result = {
                "type": "not",
                "formula": self._parse_node(node["child"])
            }
            print(f"Parsed negation: {result}")
            return result
        elif op == "and":
            result = {
                "type": "and",
                "left": self._parse_node(node["left"]),
                "right": self._parse_node(node["right"])
            }
            print(f"Parsed conjunction: {result}")
            return result
        elif op == "p":
            result = {
                "type": "probability",
                "interval": [float(node["lower"]), float(node["upper"])],
                "formula": self._parse_path_formula(node["child"])
            }
            print(f"Parsed probability operator: {result}")
            return result
        elif op in ["x", "un", "u"]:
            result = self._parse_path_formula(node)
            print(f"Parsed path formula: {result}")
            return result
        else:
            raise ValueError(f"Unknown operator: {op}")

    def _parse_path_formula(self, node: Dict) -> Dict:
        """Parse path formulas (X, U, U≤n)"""
        op = node["op"].strip().lower()
        print(f"Parsing path formula with operator: {op}")

        if op == "x":
            result = {
                "type": "next",
                "formula": self._parse_node(node["child"])
            }
            print(f"Parsed Next formula: {result}")
            return result
        elif op == "un":
            result = {
                "type": "bounded_until",
                "bound": int(node["n"]),
                "left": self._parse_node(node["left"]),
                "right": self._parse_node(node["right"])
            }
            print(f"Parsed bounded until formula: {result}")
            return result
        elif op == "u":
            result = {
                "type": "until",
                "left": self._parse_node(node["left"]),
                "right": self._parse_node(node["right"])
            }
            print(f"Parsed unbounded until formula: {result}")
            return result
        else:
            raise ValueError(f"Unknown path operator: {op}")

def main():
    """Main function with command-line interface"""
    parser = argparse.ArgumentParser(description="PCTL Model Checker")
    parser.add_argument("--states", required=True, help="Path to states file")
    parser.add_argument("--transitions", required=True, help="Path to transitions file")
    parser.add_argument("--labels", required=True, help="Path to labels file")
    parser.add_argument("--formula", required=True, help="Path to PCTL formula JSON file")
    args = parser.parse_args()

    dtmc = DTMC(args.states, args.transitions, args.labels)
    result = dtmc.check_formula(args.formula)
    print(f"Formula result: {result}")

if __name__ == "__main__":
    main()