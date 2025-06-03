class Labels:
    def __init__(self, labels_file):
        self.header = []
        self.values = {}
        self.build(labels_file)
        
    def build(self, labels_file):
        with open(labels_file, 'r') as file:
            first_line = file.readline().strip().split()
            for i in first_line:
                index=i.find('=')
                self.header.append(i[index+1::])
            for line in file:
                index=line.find(':')
                key = int(line[:index])
                self.values[key] = line[index+1::].replace('(', '').replace(')', '').split()
            
        