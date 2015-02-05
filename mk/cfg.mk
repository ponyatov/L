# autotools configure

CFG = configure --disable-nls --disable-werror \
	--with-docdir=$(TMP)/doc --docdir=$(TMP)/doc

# build host configure
BCFG = $(CFG) --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = $(CFG) --prefix=$(ROOT) \
	CC="$(TCC)" CXX="$(TCXX)" \
	--host=$(TARGET) CROSS_COMPILE=$(TARGET)-
