class SparseMatrix:
    def __init__(self, transition_matrix_file = None, matrix = None):
        if transition_matrix_file != None:
            self.matrix = []
            self.build(transition_matrix_file)
        if matrix != None:
            self.matrix = matrix

    
    def set(self, row, col, value):
        if row == 0:
            a = []
        self.matrix[row][col] = value

    def get(self, row, col):
        return self.matrix[row].get(col, 0)
    
    def build(self, transition_matrix_file):
        with open(transition_matrix_file, 'r') as file:
            first_line = file.readline().strip().split()[0]
            self.matrix = [{} for i in range(int(first_line))]
            for line in file:
                row, col, value = line.split()
                self.set(int(row), int(col), float(value))
                
    def multiply_with(self, sparseMatrix):
        matrix = sparseMatrix.matrix
        new_matrix = [{} for i in range(len(matrix))]
        x = 0
        for i in self.matrix:
            y = 0
            while (y<len(matrix)):
                for j in i:
                    val = i[j] * matrix[j].get(y, 0)
                    if val == 0:
                        continue
                    if y in new_matrix[x]:
                        new_matrix[x][y] += val
                    else:
                        new_matrix[x][y] = val
                y+=1
            x += 1
        return SparseMatrix(matrix = new_matrix)
    
    def multiply_n_times(self, sparseMatrix, n):
        for i in range(n):
            matrix = self.multiply_with(sparseMatrix)
            
        return SparseMatrix(matrix = matrix)
    
    def vector_multiply_with(self, vector):
        new_vector = [0 for i in range(len(vector))]
        for i in range(len(self.matrix)): # columns
            counter = 0
            for j in vector: # rows
                val = j * self.matrix[counter].get(i, 0)
                if val == 0:
                    continue
                new_vector[i] += val
                counter += 1
        return new_vector
            
    def exponentiation_by_squaring(self, n, current_matrix = None):
        if current_matrix == None:
            current_matrix = SparseMatrix(matrix = self.matrix)
        if n == 1:
            return current_matrix
        if n % 2 != 0:
            val = self.multiply_with(current_matrix.multiply_with(current_matrix)) # x * x ^ 2
            print(n)
            ans = self.exponentiation_by_squaring((n - 1)/2, val) 
        else:
            val = current_matrix.multiply_with(current_matrix) # x ^ 2
            print(n)
            ans = self.exponentiation_by_squaring(n/2, val)
        return ans