# Raspberry Pi SoC BCM2835: ARM1176JZF-S
# target arch is ARM11 hard-float
ARCH = armhf
# target triplet in armhf.mk
# target CPU configure params
CFG_CPU = --with-cpu=arm1176jzf-s
CFLAGS_CPU = -mcpu=arm1176jzf-s
## --with-arch=armv6  
#
## -march=armv6  -mfpu=vfp -mfloat-abi=hard
## http://www.gurucoding.com/en/rpi_cross_compiler/building_binutils_gcc1_cygwin_vm.php
CFG_CPU_LIBS = --disable-mmx

QEMU_CPU = -cpu arm1176
