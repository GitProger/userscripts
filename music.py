#!/usr/bin/env python3
#
# Use this file to comfortable music download with 'MediaSave'
#
import sys, os, re;
from getpass import getuser
from mutagen.easyid3 import EasyID3

def main(argv: list):
    __music__ = "/home/" + getuser() + "/Музыка/"
    __downloads__ = "/home/" + getuser() + "/Загрузки/"
    for f in os.listdir(__downloads__):
        if re.search(".mp3$", f):
            old = __downloads__ + f
            if "-i" in argv: # ignore
                continue
            name = __music__ + input(f[:-len(".mp3")] + " to: ") + ".mp3"
            os.renames(old, name)            
            try:
                audio = EasyID3(name)
                audio['title'] = input("Title: ")
                audio['artist'] = input("Artist: ")
                audio['album'] = input("Album: ")
                audio['composer'] = input("Composer: ")
                audio.save()
            except:
                print("Not ID3 file")
    return 0

if __name__ == "__main__":
    exit(main(sys.argv))
