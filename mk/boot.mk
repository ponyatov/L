
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
boot: boot_$(ARCH)
.PHONY: boot_arm
boot_arm: uboot
.PHONY: boot_armhf
boot_armhf: uboot

UBOOT_CFG = CROSS_COMPILE=$(TARGET)- HOSTCC="$(BCC)" CC="$(TCC)"

.PHONY: uboot
uboot: $(SRC)/$(UBOOT)/README
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) distclean
	make uboot_$(HW)
#	cat boot/uboot/all >> $(SRC)/$(UBOOT)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(UBOOT)/.config
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) menuconfig
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) u-boot.img
	cp $(SRC)/$(UBOOT)/u-boot.bin $(BOOT)/u-boot.img
#	cp $(SRC)/$(UBOOT)/u-boot.img $(BOOT)/
.PHONY: uboot_rpiB
uboot_rpiB:
	cd $(SRC)/$(UBOOT) && $(MAKE) $(UBOOT_CFG) rpi_defconfig
	cp -r boot/rpi/* $(BOOT)/
.PHONY: uboot_net
uboot_net:
	$(SRC)/$(UBOOT)/tools/mkimage
