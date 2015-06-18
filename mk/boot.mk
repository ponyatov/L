
UNZISO = unzip -jn $(GZ)/$(SYSLINUX).zip -d $(ISO)

.PHONY: iso
iso: $(BOOT)/$(HW)$(APP).iso 
$(BOOT)/$(HW)$(APP).iso: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs \
syslinux/isolinux.cfg	
	rm -rf $(ISO) && mkdir $(ISO)
	cp $(BOOT)/$(HW)$(APP).kernel $(ISO)/kernel
	cp $(BOOT)/$(HW)$(APP).rootfs $(ISO)/rootfs
	cp syslinux/memtest.krn $(ISO)/
	cp share/splash640x480.png $(ISO)/splash.png
	$(UNZISO) bios/com32/elflink/ldlinux/ldlinux.c32
	$(UNZISO) bios/com32/lib/libcom32.c32
	$(UNZISO) bios/com32/libutil/libutil.c32
	$(UNZISO) bios/com32/menu/menu.c32
	$(UNZISO) bios/com32/menu/vesamenu.c32
	$(UNZISO) bios/core/isolinux.bin
	cp syslinux/isolinux.cfg $(ISO)/syslinux.cfg
	$(MKISO) -no-emul-boot -boot-info-table -b isolinux.bin \
		-o $(BOOT)/$(HW)$(APP).iso $(ISO)
#-r -J

.PHONY: boot
boot: boot_$(HW)

RPI_SD ?= /dev/sdb1
.PHONY: boot_rpiB
boot_rpiB: $(BOOT)/u-boot.bin
	make uboot-scr
	mkdir -p $(TMP)/SD
	-sudo mount $(RPI_SD) $(TMP)/SD
#	sudo cp -r boot/rpi/* $(TMP)/SD/
	sudo cp -r boot/rpi/config.txt $(TMP)/SD/ 
	sudo cp -r $(BOOT)/u-boot.bin $(TMP)/SD/
	sudo cp -r $(BOOT)/boot.scr.uimg $(TMP)/SD/
	sudo cp -r $(BOOT)/uEnv.txt $(TMP)/SD/
	sudo cp -r $(BOOT)/$(HW)$(APP)* $(TMP)/SD/
#	sudo umount $(TMP)/SD

.PHONY: boot_arm
boot_arm: uboot
.PHONY: boot_armhf
boot_armhf: uboot

UBOOT_CFG = CROSS_COMPILE=$(TARGET)- HOSTCC="$(BCC)" CC="$(TCC)" \
	CONFIG_NETCONSOLE=y

.PHONY: uboot
uboot: $(SRC)/$(UBOOT)/README
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) distclean
	make uboot_$(HW)
	cat boot/uboot/all >> $(SRC)/$(UBOOT)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(UBOOT)/.config
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) menuconfig
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) u-boot.img
	cp $(SRC)/$(UBOOT)/u-boot.bin $(BOOT)/
	cp $(SRC)/$(UBOOT)/tools/mkimage $(TC)/bin/
	cp $(SRC)/$(UBOOT)/tools/netconsole $(TC)/bin/
#$(BOOT)/u-boot.img: $(SRC)/$(UBOOT)/README

.PHONY: uboot-scr
uboot-scr:
	cp boot/rpi/bcm2708-rpi-b.dtb $(BOOT)/ 
	cp boot/uboot/$(HW).uenv $(BOOT)/uEnv.txt
	$(TC)/bin/mkimage \
		-A arm -O linux -T script -C none \
		-n boot.scr -d boot/uboot/$(HW).scr \
		$(BOOT)/boot.scr.uimg
#	$(TC)/bin/mkimage \
#		-A arm -O linux -T kernel -C none \
#		-a 0x80008000 -e 0x80008000 \
#		-n "Linux kernel" -d arch/arm/boot/zImage \
#		uImage

.PHONY: uboot_rpiB
uboot_rpiB:
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) rpi_defconfig
#	cp -r boot/rpi/* $(BOOT)/
