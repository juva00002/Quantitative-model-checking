import sparce_matrix 


def next_operator(set_B,sparse_matrix,i): 
    p_sum = 0.0 
    print(sparse_matrix.matrix[i])  
    for j in set_B: 

        p_sum += sparse_matrix.get(i, j) 
    
    return p_sum  

def bounded_until(set_A, set_B, sparse_matrix, i, n):
    # Base cases
    if i in set_B:
        return 1.0
    if i not in set_A or n == 0:
        return 0.0
    
    # Recursive case
    total_sum = 0.0
    # Iterate through ACTUAL transitions from state i
    for j, prob in sparse_matrix.matrix[i].items():
        total_sum += prob * bounded_until(set_A, set_B, sparse_matrix, j, n-1)
    return total_sum  

def until_operator(set_A, set_B, sparse_matrix, p=1e-6):
  
    # Initialize probabilities
    x_prev = [0.0] * len(sparse_matrix.matrix)
    for i in set_B:
        x_prev[i] = 1.0
    
    while True:
        x_current = x_prev.copy()
        max_diff = 0.0
        
        for i in range(len(sparse_matrix.matrix)):
            if i in set_B:
                continue  # Already 1.0
            if i not in set_A:
                x_current[i] = 0.0
                continue
                
            # Compute new probability
            x_current[i] = 0.0
            for j, prob in sparse_matrix.matrix[i].items():
                x_current[i] += prob * x_prev[j]
            
            # Track maximum relative difference
            if x_current[i] > 0:
                rel_diff = abs(x_current[i] - x_prev[i]) / x_current[i]
                max_diff = max(max_diff, rel_diff)
        
        # Check stopping condition
        if max_diff < p:
            break
            
        x_prev = x_current
    
    return x_current
        

    


def main():
    # Load the transition matrix from file
    transition_matrix = sparce_matrix.SparseMatrix("b.txt") 
    print(transition_matrix) 
    i = 0
    #for elem in transition_matrix.matrix: 
        #print(i , elem)   
        #i += 1  

    #print(next_operator([1, 2, 3], transition_matrix, 0)) 
    print(next_operator([10, 17, 21,22], transition_matrix, 0))

if __name__ == "__main__":
    main()







