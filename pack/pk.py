#!/usr/bin/env python

PKZ = {
       'sdk':[
              r'/lib/.+\.a$',
              r'/lib/.{0,1}crt.\.o$',
              r'/include/'
              ]
       }
PKF={}

import os, sys, time, re

print '=' * 40

print time.localtime()[:6], sys.argv

PACK = sys.argv[1] ; print 'PACK', PACK

ALL  = map(lambda x:x[:-1],open('%s/allfiles' %PACK).readlines())
ROOT = open('%s/rootfiles'%PACK,'w')

for i in PKZ:
    PKF[i]=open('%s/%s.files'%(PACK,i),'w')
    
for fn in ALL:
    F=False
    for pk in PKZ:
        for rx in PKZ[pk]:
            if re.findall(rx,fn):
                print >>PKF[pk],fn
                F=True
    if not F:
        print >>ROOT,fn

print '=' * 40
