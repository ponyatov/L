# download sw packages sources to gz/

.PHONY: gz
gz:
#	exit -1
	make gz_cc
	make gz_core
	make gz_libs
	make gz_sdk
	make gz_$(ARCH)
	make gz_apps
	
.PHONY: gz_cc
gz_cc:
	$(WGET) http://ftp.gnu.org/gnu/binutils/$(BINUTILS).tar.bz2
	$(WGET) http://gcc.skazkaforyou.com/releases/$(GCC)/$(GCC).tar.bz2
	$(WGET) ftp://ftp.gmplib.org/pub/gmp/$(GMP).tar.bz2
	$(WGET) http://www.mpfr.org/mpfr-current/$(MPFR).tar.bz2
	$(WGET) http://www.multiprecision.org/mpc/download/$(MPC).tar.gz
		
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

.PHONY: gz_sdk
gz_sdk:
	$(WGET) ftp://ftp.hu.freepascal.org/pub/fpc/dist/$(FPC_VER)/source/$(FPC).source.tar.gz
	$(WGET) ftp://ftp.hu.freepascal.org/pub/fpc/dist/$(FPC_VER)/source/fpcbuild-$(FPC_VER).tar.gz
	$(WGET) http://downloads.sourceforge.net/project/ecls/ecls/$(ECL_VER_A)/$(ECL).tgz

.PHONY: gz_i386
gz_i386:
	$(WGET) https://www.kernel.org/pub/linux/utils/boot/syslinux/$(SYSLINUX).zip	

.PHONY: gz_arm
gz_arm:
	$(WGET) ftp://ftp.denx.de/pub/u-boot/$(UBOOT).tar.bz2

.PHONY: gz_apps
gz_apps:
	$(WGET) http://elinks.or.cz/download/$(ELINKS).tar.bz2
