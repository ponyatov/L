# autotools configure

CFG = configure --disable-nls

# build host configure
BCFG = $(CFG) --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = $(CFG) --prefix=$(ROOT)/sdl \
	CC="$(TCC)" CXX="$(TCXX)" \
	--host=$(TARGET)

#	CROSS_COMPILE=$(CPU)-
	
#	 

# \
#	CC="$(TCC) -static-libgcc" CXX="$(TCXX)" \
#	--build=$(BUILD) --host=$(TARGET) --target=$(TARGET)
#	CROSS_COMPILE=$(TARGET)- \
