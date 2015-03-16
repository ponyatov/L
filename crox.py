#!/usr/bin/env python
import os, sys, time, re

print time.localtime()[:6], sys.argv

# object lists per class (blue arrow)
GVIZ = {}
# class inheritance links (green arrow)
GVIX = []
def gvx(pair):
    global GVIX
    if pair not in GVIX: GVIX += [pair] 
# object usage in classes (red arrow)
GVIU = []
def gvu(pair):
    global GVIU
    if pair not in GVIU: GVIU += [pair] 

class GraphViz:
    """parent class for all classes included in class tree graph"""
    def __init__(self):
        try:
            GVIZ[self.__class__.__name__]+=[self.dot()]
        except KeyError:
            GVIZ[self.__class__.__name__] =[self.dot()]
        for b in self.__class__.__bases__: 
            gvx((str(b.__name__),self.__class__.__name__))
    def dot(self):
        return '%s:%s'%(self.__class__.__name__,hash(self))

class QEMU(GraphViz):
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
        GraphViz.__init__(self)
    def dot(self): return self.cfg
    def __str__(self):
        return '%s -m %sM %s %s -append "vga=%s %s"' % (\
            self.cfg, \
            self.RAM, \
            self.NET, \
            self.TIME, \
            self.VGA, \
            self.append)

class ARCH(GraphViz):
    """architecture"""
    TARGET = ''
    CFG_ARCH = ''
    def __init__(self, Name, Qemu=''):
        self.Name = Name
        GraphViz.__init__(self)
        gvx((GraphViz.__name__,ARCH.__name__))
        self.fh = open('arch/%s.mk' % self.Name, 'w')
        self.QEMU = Qemu
        print >> self.fh, '# arch: %s %s' % (self.__class__.__name__,self.Name)
        if self.TARGET:
            print >> self.fh, 'TARGET = %s' % self.TARGET
        print >> self.fh, 'CFG_ARCH = %s' % self.CFG_ARCH
    def dot(self): return 'arch:%s'%self.Name
class ARCH_X86(ARCH):
    CFG_ARCH = '--disable-multilib'
    def __init__(self, Name, Qemu='-M pc'):
        ARCH.__init__(self, Name, Qemu)
class ARCH_ARM(ARCH):
    TARGET = 'arm-linux-uclibceabi'
    CFG_ARCH = '--disable-interwork'
    def __init__(self, Name, Qemu='-M versatilepb'):
        ARCH.__init__(self, Name, Qemu)
class ARCH_ARMHF(ARCH_ARM):
    TARGET = 'arm-linux-uclibceabihf'
    CFG_ARCH = ARCH_ARM.CFG_ARCH + ' --with-float=hard'
    def __init__(self, Name, Qemu='-M versatilepb'):
        ARCH_ARM.__init__(Name, Qemu)
class ARCH_MIPS(ARCH):
    TARGET = 'mips-linux-uclibceabi'
    def __init__(self, Name, Qemu='-M mips'):
        ARCH.__init__(self, Name, Qemu)
            
ARCH_X86   = ARCH_X86('i386')
ARCH_ARM   = ARCH_ARM('arm')
ARCH_ARMHF = ARCH_ARMHF('armhf')
ARCH_MIPS  = ARCH_MIPS('mips')

class CPU(GraphViz):
    """cpu"""
    ARCH = None
    def __init__(self, Name, QemuCpu):
        self.Name = Name
        GraphViz.__init__(self)
        gvx((GraphViz.__name__,CPU.__name__))
        self.QEMU = QEMU(cfg='%s -cpu %s'%(self.ARCH.QEMU,QemuCpu))
        gvu((self.QEMU.dot(),self.dot()))
        gvu((self.ARCH.dot(),self.__class__.__name__))
    def __str__(self):
        return self.Name
    def dot(self): return 'cpu:%s'%self.Name
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

class HW(GraphViz):
    """hardware class (board name)"""
    def __init__(self, Name, Cpu, Info=''):
        self.Name = Name
        self.CPU = Cpu
        self.Info = Info
        GraphViz.__init__(self)
        gvu((self.CPU.dot(),self.dot()))
        self.fh = open('hw/%s.mk' % self.Name, 'w')
        print >> self.fh, '# %s' % self.Info
        print >> self.fh, 'CPU = %s' % self.CPU
        print >> self.fh, 'QEMU_CFG = %s' % (self.CPU.QEMU)
    def dot(self): return '%s:%s'%(self.Name,self.Info)
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

# draw class tree graph
dot = open('dot.dot', 'w')
print >> dot, 'digraph classes {'
for gv in GVIZ:
    print >> dot, gv,' [color=Red] ;'
    for obj in GVIZ[gv]:
        print >> dot , gv ,'->','"%s"'%obj,' [color=Blue] ;'
for gx in GVIX:
    print >> dot , '"%s"'%gx[0] ,'->','"%s"'%gx[1],' [color=Green] ;'
for gx in GVIU:
    print >> dot , '"%s"'%gx[0] ,'->','"%s"'%gx[1],' [color=Red] ;'
print >> dot, '}'
dot.close()
os.system('dot dot.dot -Tpdf -o doc/crox.pdf')
