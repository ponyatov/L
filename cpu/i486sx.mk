# i486sx cpu with emulated math 
# (Vortex86sx microPC & old computers adapted)
# target arch is Intel x86 (32 bit)
ARCH = i386
# target triplet for embedded linux
TARGET = i486-linux-uclibc
# target CPU configure params
CFG_CPU_LIBS = --disable-mmx --disable-i686
CFG_CPU = --with-cpu=i486 --with-tune=i486 $(CFG_CPU_LIBS)
CFLAGS_CPU = -march=i486 -mtune=i486

QEMU_CPU = -cpu 486
