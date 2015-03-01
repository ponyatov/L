
UNZISO = unzip -jn $(GZ)/$(SYSLINUX).zip -d $(ISO)

.PHONY: iso
iso: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
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
