.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

# rules

$(USRBIN)/%: user/%.c
	$(TCC) -O2 -o $@ $< 
#	&& $(STRIP) $@
