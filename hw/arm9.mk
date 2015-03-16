# universal ARM9 soft float (arm926e little-endian)
CPU = arm926e
QEMU_CFG = -M versatilepb -cpu arm926 -m 64M -net nic -net user -localtime -append "vga=0x312 "
