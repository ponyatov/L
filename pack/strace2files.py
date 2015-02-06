#!/usr/bin/env python

REX1 = r'^\d+ (rename|linkat)\('
REX2 = r'^\d+ open\(.+O\_CREAT'

import os,sys,time,re

FILES={}

def F(P):
	try:
		FILES[P]=os.stat(P)
	except OSError:
		pass

for i in sys.stdin.readlines():
	if re.match(REX1,i[:-1]):
		F(re.findall(r'\".+?\"',i[:-1])[1][1:-1])
	elif re.match(REX2,i[:-1]):
		F(re.findall(r'\".+?\"',i[:-1])[0][1:-1])

for j in sorted(FILES.keys()):
	if re.match(r'^%s'%sys.argv[1],j):
		print j[len(sys.argv[1]):]
