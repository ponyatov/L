# universal arm-eabi
CPU = arm1176
QEMU_CFG = -M versatilepb -m 64M -net none -localtime \
	-append "root=/dev/ram"
#	-append "root=1f03 mem=64M"
#-cpu arm1176
#console=ttyAMA0
