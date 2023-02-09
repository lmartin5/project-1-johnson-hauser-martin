'''
Assignment Name: Project 1
Name 1: Hunter Hauser
Name 2: Everett Johnson
Name 3: Luke Martin
GitHub Name: lmartin5

File name: control.sage
File desc: This file contains the functions used for the 
           using the permutation cipher, contained within project1.sage.

Usage A: sage control.sage key_file
Where:
 mode is enc or dec
 key_file is the name of the file containing the key
 input is the name of the file containing text to be encrypted/decrypted
 output is the name of the file containing the result of the encrypt/decrypt operation 

Usage B: sage control.sage mode key_file input output
Where:
 mode is enc or dec
 key_file is the name of the file containing the key
 input is the name of the file containing text to be encrypted/decrypted
 output is the name of the file containing the result of the encrypt/decrypt operation 
'''

import os
os.system('sage --preparse project1.sage')
os.system('mv project1.sage.py project1.py')
import project1 as proj1 

def init(args):
    mode = args[1]
    key_file = open(args[2],'r')
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key_file, fin, fout    

def process(args):
    mode, key_file, fin, fout = init(args)
    key = key_file.read()
    data = fin.read().upper()

    if (mode == 'enc'):
        for ch in data:
            if (ch.isalpha()):
                ch = proj1.encrypt(ch, key)
            fout.write(ch)
    
    elif (mode == 'dec'):
        decrypt_dict = {}
        for i in range(ord('A'), ord('Z') + 1):
            decrypt_dict[proj1.encrypt(chr(i), key)] = chr(i)
        for ch in data:
            if (ch.isalpha()):
                ch = proj1.decrypt(ch, decrypt_dict)
            fout.write(ch)

    fin.close()
    fout.close()

def write_key(file_name):
    key_file = open(file_name,'w') 
    key = proj1.key_gen()
    key_file.write(str(key))
    key_file.close()

def main():
    #generate, store key
    if len(sys.argv) == 2:
        write_key(sys.argv[1])
        return

    #encrypt or decrypt
    process(sys.argv)
main()

