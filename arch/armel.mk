# arch: ARM soft float (enulated fp)
TARGET = arm-linux-uclibceabi
CFG_ARCH = --disable-interwork --with-float=soft
QEMU_ARCH = -M versatilepb
