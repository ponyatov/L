# Raspberry Pi model B
CPU = BCM2835
QEMU_HW =

# custom build for specific vendor  
VENDOR = rpi
HW_KERNEL = KERNEL=kernel
DEFCONFIG = bcmrpi_defconfig

QEMU_CONSOLE = console=ttyAMA0,115200 kgdboc=ttyAMA0 
#QEMU_CFG = \
#	-serial file:serial.log \
#	-append "console=ttyAMA0,115200"
##	console=ttyAMA0,115200"
##	
##earlycon=smh
## -nographic
