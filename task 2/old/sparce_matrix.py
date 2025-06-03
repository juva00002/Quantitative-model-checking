class SparseMatrix:
    def __init__(self, transition_matrix_file):
        self.diagonal = []
        self.off_diagonal = []
        self.build(transition_matrix_file)

    def set(self, row, col, value):
        if row != col:
            self.off_diagonal[row][col] = value
        else:
            self.diagonal[row] = value

    def get(self, row, col):
        if row != col:
            return self.off_diagonal[row].get(col, 0)
        return self.diagonal[row]
    
    def build(self, transition_matrix_file):
        with open(transition_matrix_file, 'r') as file:
            first_line = file.readline().strip().split()[0]
            self.diagonal = [0 for i in range(int(first_line))]
            self.off_diagonal = [{} for i in range(int(first_line))]
            for line in file:
                row, col, value = line.split()
                self.set(int(row), int(col), float(value))
                
    def multiply_with(self, diagonal, off_diagonal):
        new_diagonal = [0 for i in range(len(diagonal))]
        new_off_diagonal = [{} for i in range(len(off_diagonal))]
        # off diag with off diag
        x = 0
        for i in off_diagonal:
            y = 0
            while (y<len(off_diagonal)):
                for j in i:
                    new_off_diagonal[x][j.key] += j.value * off_diagonal[x].get(j.key, 0)
                y+=1
            x += 1
        # off diag with diag
        x = 0
        for i in off_diagonal:
            for j in i:
                new_off_diagonal[x][j.key] += j.value * diagonal[x]
        # diag with diag
        # diag with off diag