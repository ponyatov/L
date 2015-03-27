# software packages

# [c]ross [c]ompiler

BINUTILS	= binutils-$(BINUTILS_VER)
GMP			= gmp-$(GMP_VER)
MPFR		= mpfr-$(MPFR_VER)
MPC = mpc-$(MPC_VER)
GCC = gcc-$(GCC_VER)

# core

KERNEL = linux-$(KERNEL_VER)
ULIBC = uClibc-$(ULIBC_VER)
BUSYBOX = busybox-$(BUSYBOX_VER)

# loaders

SYSLINUX = syslinux-$(SYSLINUX_VER)
UBOOT = u-boot-$(UBOOT_VER)

# libs

## SDL2 not works with FB
SDL = SDL-$(SDL_VER)
SDL_IMAGE = SDL_image-$(SDL_IMAGE_VER)
SDL_TTF = SDL_ttf-$(SDL_TTF_VER)

## extra
ZLIB = zlib-$(ZLIB_VER)
PNG = libpng-$(PNG_VER)
FREETYPE = freetype-$(FREETYPE_VER)

## math
PCRE = pcre-$(PCRE_VER)
BLAS = BLAS
ATLAS = atlas$(ATLAS_VER)

# extra
## SDK

### Python
PYTHON = Python-$(PYTHON_VER)

### PASCAL
FPC = fpc-$(FPC_VER)

# math
ECL = ecl-$(ECL_VER)
OCTAVE = octave-$(OCTAVE_VER)
MAXIMA = maxima-$(MAXIMA_VER)

# apps
LINKS = links-$(LINKS_VER)
ELINKS = elinks-$(ELINKS_VER)
