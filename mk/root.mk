ROOTREX = "./(boot|pack)"

.PHONY: root
root:
	# 1
	rm -rf $(ETC) ; cp -r etc $(ROOT)/
	cat app/$(APP).rcS >> $(ROOT)/etc/init.d/rcS
	cp README.md $(ETC)/
	cp app/$(APP).cron $(ETC)/cron/root 
	chmod +x $(ETC)/init.d/* $(ETC)/dhcp.rc
	# 2	
	$(LDCONFIG) -v -r $(ROOT)
	# 3
	ln -fs /sbin/init $(ROOT)/init
	# 4
	cp -r share $(ROOT)/
	# 5
	cd $(ROOT) &&\
	find . | egrep -v $(ROOTREX) | cpio -o -H newc > $(BOOT)/$(HW)$(APP).cpio
	cat $(BOOT)/$(HW)$(APP).cpio | gzip -9 > $(BOOT)/$(HW)$(APP).rootfs
