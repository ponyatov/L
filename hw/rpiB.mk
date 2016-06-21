# Raspberry Pi model B
CPU = BCM2835
QEMU_HW =

# custom build for specific vendor  
VENDOR = rpi
DEFCONFIG = bcmrpi_defconfig
HW_KERNEL = KERNEL=kernel

#QEMU_CFG = \
#	-serial file:serial.log \
#	-append "console=ttyAMA0,115200"
##	console=ttyAMA0,115200"
##console=ttyAMA0,115200 kgdboc=ttyAMA0	
##earlycon=smh
## -nographic
