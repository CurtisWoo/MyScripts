#!/usr/bin/env python

import os
import sys

'''
Creates a markdown file of links to files in a specified directory. Output file
is called "index.md" 
'''

def index(folder):
    for each in os.listdir(folder):
        if not os.path.isdir(each):
            with open(each,'r') as t:
                header = t.readline().rstrip()

            package = '[' + header[2:] +'](./' + each[:-2] + 'html)\n'

            with open('index.md', 'a') as w:
                w.write(package)

def main():
    directory = sys.argv[1:]
    
    if not directory:
        print("usage: python indexme.py [directory]")

    else:
        index(directory[0])
        
if __name__ == "__main__":
    main()
