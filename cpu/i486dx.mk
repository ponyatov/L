# i486dx cpu with integrated FPU math coprocessor
# target arch is Intel x86 (32 bit)
ARCH = i386
# target triplet for embedded linux
TARGET = i486-linux-uclibc
# target CPU configure params
CPU_FFMPEG = --disable-mmx --disable-i686
CFG_CPU = --with-cpu=i486 --with-tune=i486
CFLAGS_CPU = -march=i486 -mtune=i486

QEMU_CPU = -cpu 486
