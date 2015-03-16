# universal i686 PC (32 bit) PII+
CPU = i686
QEMU_CFG = -M pc -cpu pentium2 -m 64M -net nic -net user -localtime -append "vga=0x312 "
