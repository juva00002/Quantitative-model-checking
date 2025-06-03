import sparce_matrix
import states
import labels

def main():
    file = input("path to transition matrix file:")
    transition_matrix = sparce_matrix.SparseMatrix(file)
    file = input("path to states file:")
    state = states.States(file)
    file = input("path to labels file:")
    label = labels.Labels(file)
    while True:
        n = input("calculate transient probabilities at which step:")
        n = int(n)
        matrix3 = transition_matrix.exponentiation_by_squaring(n)
        a = [0 for i in range(len(matrix3.matrix))]
        a[0] = 1
        a = matrix3.vector_multiply_with(a)
        print(a)

if __name__ == "__main__":
    main()