# Raspberry Pi model B
CPU = BCM2835
QEMU_CFG = -M versatilepb -cpu arm1176 -m 32M -net none \
	-serial stdio \
	-append "console=ttyAMA0,115200"
