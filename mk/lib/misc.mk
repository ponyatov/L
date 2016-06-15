CFG_NCURSES = --disable-nls --disable-werror \
	--mandir=$(TMP)/man --infodir=$(TMP)/info \
	--prefix=$(TMP)/ncurses \
	CC=" i686-linux-uclibc-gcc -pipe" CXX=" i686-linux-uclibc-g++ -pipe" \
	--host=i686-linux-uclibc CROSS_COMPILE=i686-linux-uclibc-

.PHONY: ncurses
ncurses: $(SRC)/$(NCURSES)/README
#	rm -rf $(TMP)/$(NCURSES) && mkdir $(TMP)/$(NCURSES) &&\
#	cd $(TMP)/$(NCURSES) &&\
#	$(XPATH) $(SRC)/$(NCURSES)/configure $(CFG_NCURSES) && $(MAKE)
#	$(call INSTPACK,$(TMP)/$(NCURSES),$@,install)
#	mv $(TMP)/ncurses/include/ncurses $(ROOT)/include/
	mv $(TMP)/ncurses/lib/lib*.a $(ROOT)/lib/