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
gz_sdk: gz_python
	$(WGET) ftp://ftp.hu.freepascal.org/pub/fpc/dist/$(FPC_VER)/source/$(FPC).source.tar.gz
	$(WGET) ftp://ftp.hu.freepascal.org/pub/fpc/dist/$(FPC_VER)/source/fpcbuild-$(FPC_VER).tar.gz
	$(WGET) http://downloads.sourceforge.net/project/ecls/ecls/$(ECL_VER_A)/$(ECL).tgz

.PHONY: gz_python
gz_python:
	exit -1
	$(WGET) https://www.python.org/ftp/python/$(PYTHON_VER)/$(PYTHON).tar.xz
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/001-remove-host-header-path.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/002-fix-get-python-inc.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/004-sysconfigdata-install-location.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/005-pyc-pyo-conditional.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/006-cross-compile-getaddrinfo.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/007-disable-extensions.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/008-distutils-use-python-sysroot.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/009-no-termcap-host-path.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/010-fix-python-config.patch
	$(WGET) -P patch/python http://git.buildroot.net/buildroot/plain/package/python/011-remove-python-symlink.patch

.PHONY: gz_i386
gz_i386:
	$(WGET) https://www.kernel.org/pub/linux/utils/boot/syslinux/$(SYSLINUX).zip	

.PHONY: gz_arm
gz_arm:
	$(WGET) ftp://ftp.denx.de/pub/u-boot/$(UBOOT).tar.bz2

.PHONY: gz_apps
gz_apps:
	$(WGET) http://elinks.or.cz/download/$(ELINKS).tar.bz2
