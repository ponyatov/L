#!/usr/bin/env python

RexedPacks = {
    'sdk':[
        r'/lib/.+\.a$',
        r'/lib/.{0,1}crt.\.o$',
        r'/include',
    ],
    'gmp':[r'/lib/lib(gmp|mpfr|mpc).+']
}
PKF = {}

TracedPacks = {
    'binutils.host':[],
    'gcc.host':[],
    'gmp':[],'mpfr':[],'mpc':[]
}

TracedFiles = []

import os, sys, time, re

print '=' * 40

print time.localtime()[:6], sys.argv

ROOT = sys.argv[1] ; print 'ROOT', ROOT
PACK = ROOT + '/pack' ; print 'PACK', PACK

AllFiles = map(lambda x:x[:-1], open('%s/allfiles' % PACK).readlines())
RootFiles = open('%s/rootfiles' % PACK, 'w')

for i in RexedPacks:
    PKF[i] = open('%s/%s.files' % (PACK, i), 'w')
for j in TracedPacks:
    PKF[j] = open('%s/%s.files' % (PACK, j), 'w')
    TracedPacks[j] = []
    for k in map(lambda x:x[:-1], open('%s/%s.strace' % (PACK, j)).readlines()):
        for ss in re.findall(r'(\w+)\(.*\"%s/(.+)\"' % ROOT, k):
            if ss[0] not in ['stat','lstat'] and \
            not (ss[0]=='open' and not re.findall(r'O_CREAT',k)):
                try:
                    FullFileName = ROOT + '/' + ss[1]
#                     os.stat(FullFileName)
                    if not os.path.isdir(FullFileName):
                        SFile = './' + ss[1]
                        if SFile not in TracedFiles:
                            TracedFiles.append(SFile)
                            TracedPacks[j].append(SFile)
                except OSError:
                    pass

# process allfiles -> rootfiles    
for AllFileName in AllFiles:
    isFileInPack = False
    for pk in TracedPacks:
        if AllFileName in TracedPacks[pk]:
            print >> PKF[pk], AllFileName
            isFileInPack = True
    for pk in RexedPacks:
        for rx in RexedPacks[pk]:
            if AllFileName not in TracedFiles:
                if re.findall(rx, AllFileName):
                    print >> PKF[pk], AllFileName
                    isFileInPack = True
    if not isFileInPack:
        print >> RootFiles, AllFileName

print '=' * 40
