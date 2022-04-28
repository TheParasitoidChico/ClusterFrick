#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 25 20:57:43 2022
pipe_imp_2.py
@author: christian
"""
print("hello boys")
Taxa_id_file = open('TAXA_ID.txt', 'w')
list_dict = []
import json
import re


with open('PIPE_TAXA.txt', 'r') as p:
    for i in p.readlines():
        i = i.replace('\'', '\"')
        try:
            found = re.search(r'\"\d*\"', i).group(0)
            tax_id = found.strip('\"')
            #print(tax_id)
            Taxa_id_file.write(tax_id + '\n')
        except AttributeError:
            pass
            
        
    