#!/usr/bin/env python3
import sys, os;
from getpass import getuser

def main(argv: list):
    __music__ = "/home/" + getuser() + "/Музыка/"
    __downloads__ = "/home/" + getuser() + "/Загрузки/"
    for f in os.listdir(__downloads__):
        if ".mp3" in f:
            old = __downloads__ + f
            if len(argv) < 2:
                new = __music__ + f
            elif argv[1] == "-n":
                print(f[:-len(".mp3")], "to:", end=" ")
                new = __music__ + input() + ".mp3"
            else:
                print("Invalid argument:", argv[1])
                return -1;
            os.renames(old, new)
    return 0

if __name__ == "__main__":
    exit(main(sys.argv))
