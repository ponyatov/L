# VoCore RT5350F WiSoC: MIPS 24KEc, 360 MHz
# target arch is MIPS 24KEc
ARCH = mips
# target triplet in mips.mk
# target CPU configure params
CFG_CPU = 
#--with-cpu=arm1176jzf-s
CFLAGS_CPU = 
#-mcpu=arm1176jzf-s
## --with-arch=armv6  
#
## -march=armv6  -mfpu=vfp -mfloat-abi=hard
## http://www.gurucoding.com/en/rpi_cross_compiler/building_binutils_gcc1_cygwin_vm.php
CFG_CPU_LIBS = 
#--disable-mmx

QEMU_CPU = -cpu 24Kc
