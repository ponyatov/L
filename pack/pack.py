#!/usr/bin/env python
import os,sys,re,time
print time.localtime()[:6],sys.argv

PACK=sys.argv[1]
ALLFILES=open('%s/allfiles'%PACK)
ROOTFILES=open('%s/rootfiles'%PACK,'w')

while 1:
    F=ALLFILES.readline()[:-1]
    if not F: break
    print >>ROOTFILES,F

