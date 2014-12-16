# commands macros

XPATH = PATH=$(TC)/bin:$(PATH)

WGET = wget -N -P $(GZ)

CPU_CORES ?= $(shell grep processor /proc/cpuinfo |wc -l) 

MAKE = $(XPATH) make -j$(CPU_CORES)

CCACHE = ccache

BCC = $(CCACHE) gcc -pipe
BCXX = $(CCACHE) g++ -pipe

LDD = $(XPATH) $(CPU)-ldd
LDCONFIG = $(XPATH) $(CPU)-ldconfig
GETCONF = $(XPATH) $(CPU)-getconf
