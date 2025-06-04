class States:
    def __init__(self, labels_file):
        self.header = []
        self.values = []
        self.build(labels_file)
        
    def build(self, labels_file):
        with open(labels_file, 'r') as file:
            first_line = file.readline().strip().replace('(', '').replace(')', '').split(",")
            for i in first_line:
                self.header.append(i)
            for line in file:
                index=line.find(':')
                self.values.append(list(map(int, line[index+1::].strip().replace('(', '').replace(')', '').split(','))))
            
        