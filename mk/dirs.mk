# directories processing

# sw sources mirror archive in .tar.[GZ]

GZ = $(PWD)/gz

# [S]ou[RC]e codes unpacked

SRC = $(PWD)/src

# [T]e[MP] build dirs

TMP = $(PWD)/tmp

# build/target triplets
BUILD = $(shell gcc -dumpmachine)
# cross-compiler [T]ool[C]hain
TC = $(PWD)/$(BUILD)

# target root filesystem

ROOT = $(PWD)/$(HW)$(APP)
BOOT = $(ROOT)/boot
ETC = $(ROOT)/etc
USR = $(ROOT)/usr
USRBIN = $(USR)/bin
USRLIB = $(USR)/lib

DIRS = $(GZ) $(SRC) $(TMP) $(TC) $(ROOT) $(BOOT) $(USR) $(USRBIN) $(USRLIB)

.PHONY: dirs
dirs:
	mkdir -p $(DIRS)
