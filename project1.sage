'''
Assignment Name: Project 1
Name 1: Hunter Hauser
Name 2: Everett Johnson
Name 3: Luke Martin
GitHub Name: lmartin5

File name: project1.sage
File desc: This file contains the functions used for the 
           permutation cipher. It has functions for generating 
           keys, and decrypting/encrypting using a key.
'''

def key_gen():
    """Generates a key for the permutation cipher.
    Params: None
    Returns: string of 26 capital letters permuted randomly
    """
    alph = [chr(x) for x in range(ord('A'), ord('Z') + 1)]
    key = Permutations(alph).random_element()
    key = ''.join(key)
    return key  

def encrypt(ch,key):
    """Encrypts a character using a key for the permutation cipher.
    Params: 
        ch: the character to be encrypted
        key: string of 26 capital letters permuted randomly
    Returns: encrypted character
    """
    return key[ord(ch) - ord('A')]

def decrypt(ch,key):
    """Decrypts a character using a key for the permutation cipher.
    Builds a dictionary that acts as the inverse function to encrypt.
    Params: 
        ch: the character to be decrypted
        key: string of 26 capital letters permuted randomly
    Returns: decrypted character
    """
    dict = {}
    for i in range(ord('A'), ord('Z') + 1):
        dict[encrypt(chr(i), key)] = chr(i)
    return dict[ch]