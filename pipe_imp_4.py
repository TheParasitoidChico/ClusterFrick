#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 26 18:33:07 2022

@author: christian
"""
import glob
filepath = '/OUPUT/*directory/blast/*-typ-subtree-db.fa'
fasta = glob.glob(filepath)
print(fasta)
for f in fasta:
    f = open(f, 'r')
    for line in f:
        try:
            print(line)
        except:
            print('ERROR, no fasta identifed or fasta empty')
        

        
