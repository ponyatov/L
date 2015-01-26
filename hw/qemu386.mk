# QEMU emulator: i386 mode
CPU = i486sx
QEMU_CFG = -m 32M -net none \
	-append "vga=4"
