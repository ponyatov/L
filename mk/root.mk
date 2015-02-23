ROOTREX = "./(boot|pack)"

.PHONY: root
root:
	# 1
	rm -rf $(ETC) ; cp -r etc $(ROOT)/
	cp README.md $(ETC)/
	chmod +x $(ETC)/init.d/*
	# 2	
	$(LDCONFIG) -v -r $(ROOT)
	# 3
	ln -fs /sbin/init $(ROOT)/init
	# 4
	cp -r share $(ROOT)/
	# 5
	cd $(ROOT) && find . | egrep -v $(ROOTREX) > $(PACK)/allfiles
	pack/pk.py $(ROOT)
	cd $(ROOT) && cat $(PACK)/rootfiles | cpio -o -H newc > $(BOOT)/$(HW)$(APP).cpio
	cat $(BOOT)/$(HW)$(APP).cpio | gzip -9 > $(BOOT)/$(HW)$(APP).rootfs
