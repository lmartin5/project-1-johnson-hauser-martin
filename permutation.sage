'''
Assignment Name: Project 1
Name 1: Hunter Hauser
Name 2: Everett Johnson
Name 3: Luke Martin
GitHub Name: lmartin5
'''

def key_gen():
    alph = [chr(x) for x in range(ord('A'), ord('Z') + 1)]
    key = Permutations(alph).random_element()
    key = ''.join(key)
    return key  

def encrypt(ch,key):
    pos = ord(ch) - ord('A')
    return chr(((ord(key[pos]) + ord(ch)) % 26) + ord('A'))

def decrypt(ch,key):
    dict = {}
    for i in range(65, 91, 1):
        dict[i] = key[i - 65]
        

