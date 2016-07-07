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
BOOT = $(ROOT)/boot
LIB = $(ROOT)/lib
ETC = $(ROOT)/etc
USR = $(ROOT)/usr
USRBIN = $(USR)/bin
USRLIB = $(USR)/lib
# cross-compiler [T]ool[C]hain
TC = $(ROOT).cross
PACK = $(TC)/pack
ISO = $(TMP)/iso

DIRS = $(GZ) $(SRC) $(TMP) $(TC) $(PACK) $(ROOT) $(BOOT) $(USR) $(USRBIN)
#	$(LIB) $(USRLIB) 

.PHONY: dirs
dirs:
	mkdir -p $(DIRS)
