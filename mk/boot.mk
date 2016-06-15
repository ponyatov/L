
.PHONY: boot
boot: boot_$(HW)

.PHONY: boot_x86
boot_x86: iso

UNZISO = unzip -jn $(GZ)/$(SYSLINUX).zip -d $(ISO)

.PHONY: iso
iso: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs \
boot/syslinux/isolinux.cfg	
	rm -rf $(ISO) && mkdir $(ISO)
	cp $(BOOT)/$(HW)$(APP).kernel $(ISO)/kernel
	cp $(BOOT)/$(HW)$(APP).rootfs $(ISO)/rootfs
	cp boot/syslinux/memtest.krn $(ISO)/
	cp share/splash640x480.png $(ISO)/splash.png
	$(UNZISO) bios/com32/elflink/ldlinux/ldlinux.c32
	$(UNZISO) bios/com32/lib/libcom32.c32
	$(UNZISO) bios/com32/libutil/libutil.c32
	$(UNZISO) bios/com32/menu/menu.c32
	$(UNZISO) bios/com32/menu/vesamenu.c32
	$(UNZISO) bios/core/isolinux.bin
	cp boot/syslinux/isolinux.cfg $(ISO)/syslinux.cfg
	cp boot/windows/qemu386.bat $(BOOT)/
	cp boot/windows/README_win32.md $(BOOT)/
	$(MKISO) -no-emul-boot -boot-info-table -b isolinux.bin -V $(HW)$(APP) \
		-o $(BOOT)/$(HW)$(APP).iso $(ISO)
##-r -J

RPI_SD ?= /dev/sdc1
.PHONY: boot_rpiB
boot_rpiB:
#$(BOOT)/u-boot.bin
#	make uboot-scr
	mkdir -p $(TMP)/SD
	-sudo mount $(RPI_SD) $(TMP)/SD
#	sudo cp -r boot/rpi/* $(TMP)/SD/
	sudo rsync boot/rpi/config.txt $(TMP)/SD/config.txt 
	sudo rsync boot/rpi/cmdline.txt $(TMP)/SD/cmdline.txt 
#	sudo rsync $(BOOT)/u-boot.bin $(TMP)/SD/u-boot.bin
#	sudo cp -r $(BOOT)/boot.scr.uimg $(TMP)/SD/
#	sudo rsync $(BOOT)/$(HW)$(APP).kernel $(TMP)/SD/clock.krn
	sudo cp $(BOOT)/$(HW)$(APP).kernel $(TMP)/SD/clock.krn
#	sudo rsync $(BOOT)/$(HW)$(APP).rootfs $(TMP)/SD/clock.rfs
	sudo cp $(BOOT)/$(HW)$(APP).rootfs $(TMP)/SD/clock.rfs
	sudo umount $(TMP)/SD
##	sudo cp -r $(BOOT)/uEnv.txt $(TMP)/SD/

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

.PHONY: uboot-scr
uboot-scr:
	cp boot/rpi/bcm2708-rpi-b.dtb $(BOOT)/ 
#	cp boot/uboot/$(HW).uenv $(BOOT)/uEnv.txt
	$(TC)/bin/mkimage \
		-A arm -O linux -T script -C none \
		-n boot.scr -d boot/uboot/$(HW).scr \
		$(BOOT)/boot.scr.uimg
	$(TC)/bin/mkimage \
		-A arm -O linux -T kernel -C none \
		-a 0x80008000 -e 0x80008000 \
		-n "Linux kernel" -d $(BOOT)/kernel.img \
		$(BOOT)/kernel.uimg

.PHONY: uboot_rpiB
uboot_rpiB:
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) rpi_defconfig
#	cp -r boot/rpi/* $(BOOT)/
