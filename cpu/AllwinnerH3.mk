# Allwinner H3 Quad-Core ARM Cortex-A7 @ 1.296GHz
ARCH = armhf
VENDOR = generic
DEFCONFIG = sunxi_defconfig
# target triplet in armhf.mk
# target CPU configure params
CFG_CPU = --with-cpu=cortex-a8
CFLAGS_CPU = -mcpu=cortex-a8
#
## http://www.gurucoding.com/en/rpi_cross_compiler/building_binutils_gcc1_cygwin_vm.php
CFG_CPU_LIBS = --disable-mmx

QEMU_CPU = -cpu cortex-a8
#arm1176
