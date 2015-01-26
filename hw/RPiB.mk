# Raspberry Pi model B
CPU = BCM2835
QEMU_CFG = -M versatilepb -cpu arm1176 -m 64M -net none \
	-serial file:serial.log \
	-append "console=ttyAMA0,115200"
#	console=ttyAMA0,115200"
#console=ttyAMA0,115200 kgdboc=ttyAMA0	
#earlycon=smh
# -nographic
