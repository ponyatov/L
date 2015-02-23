# autotools configure

CFG = configure --disable-nls --disable-werror \
	--docdir=$(TMP)/doc \
	--mandir=$(TMP)/man \
	--infodir=$(TMP)/info

# build host configure
BCFG = $(CFG) --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = $(CFG) --prefix=$(ROOT) \
	CC="$(TCC)" CXX="$(TCXX)" \
	--host=$(TARGET) CROSS_COMPILE=$(TARGET)-

# canadian configure
CACFG = $(CFG) --prefix=$(ROOT) \
	CC="$(TCC)" CXX="$(TCXX)" \
	--host=$(TARGET)
