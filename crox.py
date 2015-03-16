#!/usr/bin/env python
import os, sys, time, re

print time.localtime()[:6], sys.argv

class QEMU:
    """qemu configuration variable"""
    RAM = 64
    NET = '-net nic -net user'
    TIME = '-localtime'
    VGA_MODES = {
        '?':'ask',
        '640x480x24':'0x312',
        '800x600x24':'0x315'
    }
    VGA = VGA_MODES['640x480x24']
    def __init__(self, cfg='', append=''):
        self.cfg = cfg
        self.append = append
    def __str__(self):
        return '%s -m %sM %s %s -append "vga=%s %s"' % (\
            self.cfg, \
            self.RAM, \
            self.NET, \
            self.TIME, \
            self.VGA, \
            self.append)

class ARCH:
    """architecture"""
    def __init__(self,Name,Qemu=''):
        self.Name=Name
        self.QEMU=Qemu
ARCH_X86=ARCH('i386','-M pc')
ARCH_ARM=ARCH('arm','-M versatilepb')

class CPU:
    """cpu"""
    ARCH = None
    def __init__(self, Name, QemuCpu):
        self.Name = Name
        self.QEMU = QEMU(cfg='%s -cpu %s'%(self.ARCH.QEMU,QemuCpu)) 
    def __str__(self):
        return self.Name
class CPU_X86(CPU):
    ARCH = ARCH_X86
    def __init__(self, Name, QemuCpu='486'):
        CPU.__init__(self, Name, QemuCpu)
class CPU_ARM(CPU):
    ARCH = ARCH_ARM
    def __init__(self, Name='arm926e', QemuCpu='arm926'):
        CPU.__init__(self, Name, QemuCpu)
CPU_i686 = CPU_X86(Name='i686',QemuCpu='pentium2')
CPU_926 = CPU_ARM()

class HW:
    """hardware class (board name)"""
    def __init__(self, Name, Cpu, Info=''):
        self.Name = Name
        self.CPU = Cpu
        self.Info = Info
        self.fh = open('hw/%s.mk' % self.Name, 'w')
        print >> self.fh, '# %s' % self.Info
        print >> self.fh, 'CPU = %s' % self.CPU
        print >> self.fh, 'QEMU_CFG = %s' % (self.CPU.QEMU)
HW_x86 = HW(Name='x86', Cpu=CPU_i686, Info='universal i686 PC (32 bit) PII+')
HW_ARM = HW(Name='arm9', Cpu=CPU_926, Info='universal ARM9 soft float (arm926e little-endian)')

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
        print >> self.fh, '#!/bin/sh\ncat \\'
    def run(self):
        """execute script"""
        print >> self.fh, '> Makefile'
        self.fh.close()
        return os.system(self.FileName)
    def __add__(self, id):
        print >> self.fh, '\tmk/%s \\' % str(id)
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
