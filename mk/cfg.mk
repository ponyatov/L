# autotools configure

# build host configure
BCFG = configure --prefix=$(TC) \
	CC="$(CCACHE) gcc" CXX="$(CCACHE) g++" 

# target configure
TCFG = configure
