# commands macros

XPATH = PATH=$(TC)/bin:$(PATH)

WGET = -wget -N -P $(GZ) -t2 -T2

CPU_CORES ?= $(shell grep processor /proc/cpuinfo |wc -l) 

MAKE = $(XPATH) make -j$(CPU_CORES)
INSTALL  = $(XPATH) make install
PINSTALL  = $(XPATH) strace -f -o $(PACK)/.strace -e trace=file make install
MVCONFIG = 	mv -f $(ROOT)/bin/*-config $(TC)/bin/

CCACHE =

BCC  = $(CCACHE) gcc -pipe
BCXX = $(CCACHE) g++ -pipe

TCC  = $(CCACHE) $(TARGET)-gcc -pipe
TCXX = $(CCACHE) $(TARGET)-g++ -pipe
TFORTRAN = $(CCACHE) $(TARGET)-gfortran -pipe
STRIP = $(XPATH) $(TARGET)-strip

LDD = $(XPATH) $(TARGET)-ldd
LDCONFIG = $(XPATH) $(TARGET)-ldconfig
GETCONF = $(XPATH) $(TARGET)-getconf

MKISO = genisoimage

RAMCLEAN ?= rm -rf

PACKREP = $(PWD)/pack/pack

INSTPACK = cd $1 && make $3 && touch $(PACK)/$2
#	$(XPATH) strace -fs9999 -o $(TMP)/$2.strace make $3 &&\
#	$(PACKREP) < $(TMP)/$2.strace > $(PACK)/$(2) && rm $(TMP)/$2.strace
#	tar -cmpl -T $(PACK)/$(2) | gzip -c9 - > $(PACK)/$(2).tgz
