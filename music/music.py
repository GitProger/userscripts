#!/usr/bin/env python3
import sys, os, re;
from getpass import getuser

def main(argv: list):
    argv.sort()
    __music__ = "/home/" + getuser() + "/Музыка/"
    __downloads__ = "/home/" + getuser() + "/Загрузки/"
    for f in os.listdir(__downloads__):
        if re.search("\.mp3$", f):
            old = __downloads__ + f
            if len(argv) < 2:
                new = __music__ + f
            elif "-n" in argv:
                print(f[:-len(".mp3")], "to:", end=" ")
                new = __music__ + input() + ".mp3"
            else:
                print("Invalid argument:", argv[1])
                return -1;
            os.renames(old, new)
            if "-w" in argv:
                song = input("Song name: ")
                auth = input("Author: ")
                albm = input("Album: ")
                year = input("Year: ")
                os.system("./mp3ed -n " + song + " -a " + auth + " -al " + albm + " -y " + year)
    return 0

if __name__ == "__main__":
    exit(main(sys.argv))
