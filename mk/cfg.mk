# autotools configure

# build host configure
BCFG = configure --prefix=$(TC) \
	CC="$(BCC)" CXX="$(BCXX)" 

# target configure
TCFG = configure --prefix=$(ROOT) \
	CC="$(TCC)" CXX="$(TCXX)" 
