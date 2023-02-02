'''
Assignment Name: Project 1
Name 1: Hunter Hauser
Name 2: Everett Johnson
Name 3: Luke Martin
GitHub Name: lmartin5
'''

def key_gen():
    alph = [chr(x) for x in range(ord('A'), ord('Z') + 1 )]
    key = Permutations(alph).random_element()
    key = ''.join(key)
    return key  

def encrypt(ch,key):
    pos = ord(ch) - ord('A')
    return chr((ord(key[pos]) + ord(ch)) % 26)

def decrypt(ch,key):
    pos = ord(ch) - ord('A')
    pos = (pos- key) % 26 
    pos = pos + ord('A')
    return chr(pos)


