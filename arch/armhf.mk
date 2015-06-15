# arch: ARM hard float
TARGET = arm-linux-uclibceabihf
CFG_ARCH = --disable-interwork --with-float=hard --with-fpu=vfp
QEMU_ARCH = -M versatilepb
