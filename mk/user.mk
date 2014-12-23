.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

# rules

$(USRBIN)/%: user/%.c
	$(XPATH) $(TCC) -O2 -o $@ $< 
#	&& $(STRIP) $@
