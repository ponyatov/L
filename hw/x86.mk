# universal i386 PC (32 bit) i486sx+
# (pure i386sx not supported by new gcc/kernel) 
CPU = i486sx
VENDOR = generic
DEFCONFIG = allnoconfig

QEMU_HW =
QEMU_APPEND += vga=0x315
QEMU_SOUND = -soundhw es1370
QEMU_CONSOLE = console=ttyS0,115200 console=tty0
