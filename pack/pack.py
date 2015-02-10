#!/usr/bin/env python
import os,sys,re,time
print time.localtime()[:6],sys.argv

PACK=sys.argv[1]
ALLFILES=open('%s/allfiles'%PACK)
ROOTFILES=open('%s/rootfiles'%PACK,'w')

R={}
P={}
W={}

for i in filter(lambda x:x.split('.')[-1]=='rex',os.listdir('pack')):
    PN=i.split('.')[0]
    P[PN]=open('%s/%s.files'%(PACK,PN),'w')
    R[PN]=map(lambda x:x[:-1],open('pack/%s.rex'%PN).readlines())

for F in sorted(map(lambda x:x[:-1],ALLFILES.readlines())): 
    T=0
    for i in R:
        for j in R[i]:
            if re.match(j,F):
                T=1
                try:
                    W[i][F]=1
                except KeyError:
                    W[i]={}
                    W[i][F]=1
    if not T:
        print >>ROOTFILES,F

MKP=open('%s/mkpacks.rc'%PACK,'w')
print >>MKP,'#!/bin/sh\ncd %s && cd ..'%PACK
for M in P:
    print >>MKP,'cat pack/%s.files | cpio -o -H newc > boot/%s.cpio'%(M,M)
for PN in W:
    for FL in sorted(W[PN]):
        print >>P[PN],FL
