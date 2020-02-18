#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
    Use '<meta charset="utf-8">' or 
    'Content-type: text/html; charset=utf-8' instead of 'Content-type: text/html'
'''

import sys
__standart_print = print

def cgiprint(*argv, sep=" ", end="\n", encoding="utf-8", file=sys.stdout, flush=True):
    '''
        This is 'print' function for cgi Unicode output, 
        works like standart python3's 'print'
    '''
    local_write = lambda obj: file.buffer.write(
        str(obj).encode(encoding)
    )
    for i in range(len(argv)):
        local_write(argv[i])
        if i != len(argv) - 1:
            local_write(sep)
    local_write(end)
    if flush:
        file.buffer.flush()

def assign():
    '''
        Assign standart 'print' to 'cgiprint.cgiprint'
    '''
    print = cgiprint

def cancel():
    '''
        Cancels 'cgiprint.assign'
    '''
    global __standart_print
    print = __standart_print
