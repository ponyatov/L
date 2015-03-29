# i486sx cpu
# target arch is Intel x86 (32 bit)
ARCH = i386
# target triplet for embedded linux
TARGET = i486-linux-uclibc
# target CPU configure params
CFG_CPU = --with-cpu=i486 --with-tune=i486
# --disable-mmx --disable-3dnow --disable-sse
CFLAGS_CPU = -march=i486 -mtune=i486
