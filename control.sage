'''
Assignment Name: Project 1
Name 1: Hunter Hauser
Name 2: Everett Johnson
Name 3: Luke Martin
GitHub Name: lmartin5

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
os.system('sage --preparse permutation.sage')
os.system('mv permutation.sage.py permutation.py')
import permutation as perm 

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
    for ch in data:
        if (ch.isalpha()):
            if (mode == 'enc'):
                #ch = perm.encrypt(ch,key)
                ch = perm.encrypt(ch,key)
            if (mode == 'dec'):
                ch = perm.decrypt(ch,key)
        fout.write(ch)

    fin.close()
    fout.close()

def write_key(file_name):
    key_file = open(file_name,'w') 
    key = perm.key_gen()
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

