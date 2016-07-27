# universal i386 PC (32 bit) i486sx+
# (pure i386sx not supported by new gcc/kernel) 
CPU = i486sx

# kernel mod
VENDOR = generic
DEFCONFIG = allnoconfig

# qemu
QEMU_HW =
QEMU_APPEND += vga=0x312
