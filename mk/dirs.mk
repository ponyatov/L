# directories processing

# sw sources mirror archive in .tar.[GZ]

GZ = $(PWD)/gz

# [S]ou[RC]e codes unpacked

SRC = $(PWD)/src

# [T]e[MP] build dirs

TMP = $(PWD)/tmp

# build/target triplets
BUILD = $(shell gcc -dumpmachine)

# target root filesystem

ROOT = $(PWD)/$(HW)$(APP)
# cross-compiler [T]ool[C]hain
TC = $(ROOT).cross
BOOT = $(ROOT)/boot
ETC = $(ROOT)/etc
USR = $(ROOT)/usr
USRBIN = $(USR)/bin
USRLIB = $(USR)/lib
PACK = $(ROOT)/pack
ISO = $(TMP)/iso
LIB = $(ROOT)/lib

DIRS = $(GZ) $(GZ)/patch $(GZ)/patch/python $(SRC) $(TMP) $(TC) $(ROOT) \
	$(LIB) $(BOOT) $(USR) $(USRBIN) $(USRLIB) $(PACK)

.PHONY: dirs
dirs:
	mkdir -p $(DIRS)
	cd pack && make HW=$(HW) APP=$(APP)
