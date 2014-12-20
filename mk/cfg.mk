# autotools configure

# build host configure
BCFG = configure --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = configure --prefix=$(ROOT) \
	CC="$(TCC) -static-libgcc" CXX="$(TCXX)" \
	--build=$(BUILD) --host=$(TARGET) --target=$(TARGET)
#	CROSS_COMPILE=$(TARGET)- \
#	 
