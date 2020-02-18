#!/usr/bin/env python3
# -*- coding: utf-8 -*-

'''
    Use '<meta charset="utf-8">' or 
    'Content-type: text/html; charset=utf-8' instead of 'Content-type: text/html'
'''

import sys
def cgiprint(*argv, sep=" ", end="\n", encoding="utf-8", file=sys.stdout, flush=True):
    '''
        Warning: Only python3
        This is 'print' function for cgi output, works like standart python3's 'print'
    '''
    __local_write = lambda obj: file.buffer.write(
        str(obj).encode(encoding)
    )
    for i in range(len(argv)):
        __local_write(argv[i])
        if i != len(argv) - 1:
            __local_write(sep)
    __local_write(end)
    if flush:
        file.buffer.flush()

def assign():
    '''
        Assign standart 'print' to 'cgiprint.cgiprint'
    '''
    print = cgiprint
