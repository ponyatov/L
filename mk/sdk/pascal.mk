FPC_CFG = INSTALL_PREFIX=$(PWD)/pascal \
	BINUTILSPREFIX=$(TARGET)- \
	OS_TARGET=linux CPU_TARGET=i386

#FPC=ppcx64
#OS_TARGET=linux
#CPU_TARGET=i386
#CROSSOPT="-Xd -Xt" 

#.PHONY: fpc
#fpc: $(SRC)/fpcbuild-$(FPC_VER)/Makefile
#	cd $(SRC)/fpcbuild-$(FPC_VER)/fpcsrc &&\
#	make distclean &&\
#	make all $(FPC_CFG) &&\
#	make install $(FPC_CFG)
##	  CPU_TARGET=i386 FPC=ppc386
#
#$(SRC)/fpcbuild-$(FPC_VER)/Makefile:
#	cd $(SRC) ; tar zx < $(GZ)/fpcbuild-$(FPC_VER).tar.gz

.PHONY: fpc
fpc: $(SRC)/$(FPC)/Makefile
	cd $(SRC)/$(FPC) &&\
	make $(FPC_CFG) distclean &&\
	$(XPATH) make $(FPC_CFG) build

$(SRC)/$(FPC)/Makefile:
	cd $(SRC) ; tar zx < $(GZ)/$(FPC).source.tar.gz
