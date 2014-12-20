.PHONY: user
user: 

APPS += $(USRBIN)/hello

# rules

$(USRBIN)/%: user/%.c
	$(TCC) -O2 -o $@ $< 
#	&& $(STRIP) $@
