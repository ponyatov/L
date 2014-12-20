.PHONY: user
user: $(USRBIN)/hello

# rules

$(USRBIN)/%: user/%.c
	$(TCC) -O2 -o $@ $< 
#	&& $(STRIP) $@
