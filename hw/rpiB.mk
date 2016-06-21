# Raspberry Pi model B
CPU = BCM2835
QEMU_HW =

# custom build for specific vendor  
VENDOR = rpi
DEFCONFIG = bcm2835_defconfig
HW_KERNEL = KERNEL=linux

#QEMU_CFG = \
#	-serial file:serial.log \
#	-append "console=ttyAMA0,115200"
##	console=ttyAMA0,115200"
##console=ttyAMA0,115200 kgdboc=ttyAMA0	
##earlycon=smh
## -nographic
