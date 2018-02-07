

class Fish():
    """ has a weight and eats something"""
        
    note='if it does not change put it here'
    
    def __init__(self, weight=5):
        self.weight = weight
     
        
    def eats(self):
      return 'eating...'
   
    def hasWeight(self):
        return self.weight
    
f = Fish()
print('f has weight', f.hasWeight())

f1 = Fish(7)
print('f has weight', f1.hasWeight())
print(f.note)