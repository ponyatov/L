.PHONY: user
user: $(USR)/bin/hello

# rules

$(USR)/bin/%: user/%.c
	$(TCC) -O2 -o $@ $< 
#	&& $(STRIP) $@
