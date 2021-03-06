# download sw packages sources to gz/

.PHONY: gz
gz:
	make gz_$(HW)
	make gz_$(ARCH)
	make gz_$(APP)
	make gz_cross
	make gz_core
	make gz_libs
	
.PHONY: gz_cross
gz_cross:
	$(WGET) http://ftp.gnu.org/gnu/binutils/$(BINUTILS).tar.bz2
	$(WGET) http://gcc.skazkaforyou.com/releases/$(GCC)/$(GCC).tar.bz2
	$(WGET) ftp://ftp.gmplib.org/pub/gmp/$(GMP).tar.bz2
	$(WGET) http://www.mpfr.org/mpfr-current/$(MPFR).tar.bz2
	$(WGET) http://www.multiprecision.org/mpc/download/$(MPC).tar.gz
	$(WGET) ftp://gcc.gnu.org/pub/gcc/infrastructure/$(ISL).tar.bz2
	$(WGET) ftp://gcc.gnu.org/pub/gcc/infrastructure/$(CLOOG).tar.gz
		
.PHONY: gz_core
gz_core:
	$(WGET) https://www.kernel.org/pub/linux/kernel/v3.x/$(KERNEL).tar.xz
	$(WGET) http://www.uclibc.org/downloads/$(ULIBC).tar.xz
	$(WGET) http://busybox.net/downloads/$(BUSYBOX).tar.bz2
	
.PHONY: gz_libs
gz_libs:
	$(WGET) https://www.libsdl.org/release/$(SDL).tar.gz
	$(WGET) https://www.libsdl.org/projects/SDL_image/release/$(SDL_IMAGE).tar.gz
	$(WGET) http://www.libsdl.org/projects/SDL_ttf/release/$(SDL_TTF).tar.gz
	$(WGET) http://download.sourceforge.net/libpng/$(PNG).tar.xz
	$(WGET) http://download.savannah.gnu.org/releases/freetype/$(FREETYPE).tar.bz2
	$(WGET) http://zlib.net/$(ZLIB).tar.xz

.PHONY: gz_i386
gz_i386:
	$(WGET) https://www.kernel.org/pub/linux/utils/boot/syslinux/$(SYSLINUX).zip	

.PHONY: gz_arm
gz_arm:
	$(WGET) ftp://ftp.denx.de/pub/u-boot/$(UBOOT).tar.bz2
.PHONY: gz_armhf
gz_armhf: gz_arm

.PHONY: gz_rpiB
gz_rpiB:

.PHONY: gz_x86
gz_x86:

.PHONY: gz_pc686
gz_pc686:

.PHONY: gz_clock
gz_clock:
