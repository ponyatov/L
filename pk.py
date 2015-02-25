#!/usr/bin/env python

PKZ = {
       'sdk':[
              r'/lib/.+\.a$',
              r'/lib/.{0,1}crt.\.o$',
              r'/include'
              ]
       }
PKF = {}

STRACE = {
          'binutils.host':[],
          'gcc.host':[],
          'gmp':[]
          }

import os, sys, time, re

print '=' * 40

print time.localtime()[:6], sys.argv

ROOT = sys.argv[1] ; print 'ROOT', ROOT
PACK = ROOT+'/pack' ; print 'PACK', PACK

AllFiles = map(lambda x:x[:-1], open('%s/allfiles' % PACK).readlines())
RootFiles = open('%s/rootfiles' % PACK, 'w')

for i in PKZ:
    PKF[i] = open('%s/%s.files' % (PACK, i), 'w')
for j in STRACE:
    PKF[j] = open('%s/%s.files' % (PACK, j), 'w')
    STRACE[j]=[]
    for k in map(lambda x:x[:-1], open('%s/%s.strace' % (PACK, j)).readlines()):
        for ss in re.findall(r'\"%s/(.+)\"' % ROOT, k):
             try:
                os.stat(ROOT + '/' + ss)
                SFile = './' + ss
                if SFile not in STRACE[j]:
                    STRACE[j].append(SFile)
             except OSError:
                 pass

# process allfiles -> rootfiles    
for AllFileName in AllFiles:
    isFileInPKZ = False
    for pk in PKZ:
        for rx in PKZ[pk]:
            if re.findall(rx, AllFileName):
                print >> PKF[pk], AllFileName
                isFileInPKZ = True
    for pk in STRACE:
        if AllFileName in STRACE[pk]:
            print >> PKF[pk], AllFileName
            isFileInPKZ = True
    if not isFileInPKZ:
        print >> RootFiles, AllFileName

print '=' * 40
