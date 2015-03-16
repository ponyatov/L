#!/usr/bin/env python
import os, sys, time, re

print time.localtime()[:6], sys.argv

class MK:
    """makefile"""
    def __init__(self, FileName):    
        self.FileName = FileName
    def __str__(self):
        return self.FileName
        
class RC:
    """shell script"""
    def __init__(self, FileName):
        self.FileName = FileName
        self.fh = open(self.FileName, 'w')
        print >>self.fh,'#!/bin/sh\ncat \\'
    def run(self):
        """execute script"""
        print >>self.fh,'> Makefile'
        self.fh.close()
        return os.system(self.FileName)
    def __add__(self, id):
        print >> self.fh, '\tmk/%s \\'%str(id)
        return self
    
MK_RC = RC('./mk.rc')

MK_RC += MK('head.mk')
MK_RC += MK('dirs.mk')
MK_RC += MK('versions.mk')
MK_RC += MK('packages.mk')
MK_RC += MK('commands.mk')
MK_RC += MK('clean.mk')
MK_RC += MK('gz.mk')
MK_RC += MK('src.mk')
MK_RC += MK('cfg.mk')
MK_RC += MK('cross.mk')
MK_RC += MK('core.mk')
MK_RC += MK('kernel.mk')
MK_RC += MK('ulibc.mk')
MK_RC += MK('busybox.mk')
MK_RC += MK('sdk/canadian.mk')
MK_RC += MK('sdk/python.mk')
MK_RC += MK('sdk/pascal.mk')
MK_RC += MK('sdk/math.mk')
MK_RC += MK('user.mk')
MK_RC += MK('libs.mk')
MK_RC += MK('apps.mk')
MK_RC += MK('emu.mk')
MK_RC += MK('root.mk')
MK_RC += MK('boot.mk')
MK_RC += MK('info.mk')

MK_RC.run()
