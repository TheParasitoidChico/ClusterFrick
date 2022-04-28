#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 26 09:55:21 2022

@author: christian
"""
import subprocess
with open('TAXA_ID.txt', 'r') as r:
    for i in r.readlines():
        i = i.strip('\n')
        subprocess.run(["./Phylota_RUN.sh",i])
