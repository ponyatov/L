# commands macros

XPATH = PATH=$(TC)/bin:$(PATH)

WGET = wget -N -P $(GZ)

CPU_CORES ?= $(shell grep processor /proc/cpuinfo |wc -l) 

MAKE = make -j$(CPU_CORES)

CCACHE = ccache

BCC = $(CCACHE) gcc -pipe
BCXX = $(CCACHE) g++ -pipe
