# package versions

# cross compiler

BINUTILS_VER = 2.24
GMP_VER = 5.1.3
MPFR_VER = 3.1.2
MPC_VER = 1.0.2
GCC_VER = 4.9.1
# 4.9.2 not used: bug arm/62098

# core

KERNEL_VER = 3.17.6
# 2.6.x not used: bug eth/rtl8139
ULIBC_VER = 0.9.33.2
BUSYBOX_VER = 1.22.1

# loaders

SYSLINUX_VER = 6.03
UBOOT_VER = 2015.01

# libs

## SDL2 not works with FB
SDL_VER = 1.2.15
SDL_IMAGE_VER = 1.2.12
SDL_TTF_VER = 2.0.11
FREETYPE_VER = 2.5.5

## extra
ZLIB_VER = 1.2.8
PNG_VER = 1.6.15

## math
PCRE_VER = 8.36
BLAS_VER = 3.5.0
#ATLAS_VER = 3.10.2
LAPACK_VER = 3.5.0

# extra

## SDK

### Python
PYTHON_VER = 2.7.9

### Pascal
FPC_VER = 2.6.4

## math
ECL_VER_A = 15.2
ECL_VER = $(ECL_VER_A).21
OCTAVE_VER = 3.8.2
MAXIMA_VER = 5.35.1

# apps
LINKS_VER = 2.9
ELINKS_VER = 0.11.7
