#!/usr/bin/env python
import os,sys,re,time
print time.localtime()[:6],sys.argv

PACK=sys.argv[1]
ALLFILES=open('%s/allfiles'%PACK)
ROOTFILES=open('%s/rootfiles'%PACK,'w')

R={}
P={}

for i in filter(lambda x:x.split('.')[-1]=='rex',os.listdir('pack')):
    PN=i.split('.')[0]
    P[PN]=open('%s/%s.files'%(PACK,PN),'w')
    R[PN]=map(lambda x:x[:-1],open('pack/%s.rex'%PN).readlines())

while 1:
    F=ALLFILES.readline()[:-1]
    if not F: break
    T=0
    for i in R:
        for j in R[i]:
            if re.match(j,F):
                T=1
                print >>P[i],F
    if not T:
        print >>ROOTFILES,F
