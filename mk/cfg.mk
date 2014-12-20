# autotools configure

CFG = configure --disable-nls

# build host configure
BCFG = $(CFG) --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = $(CFG) --prefix=$(ROOT) \
	CC="$(TCC)" CXX="$(TCXX)" \
	--host=$(TARGET) CROSS_COMPILE=$(TARGET)-
