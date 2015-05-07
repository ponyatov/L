# i686 CPU (32 bit) PII+
ARCH = i386
# target triplet for embedded linux
TARGET = i686-linux-uclibc
# target CPU configure params
CFG_CPU = --with-arch=i686 --with-tune=i686
CFLAGS_CPU = -march=i686 -mtune=i686
