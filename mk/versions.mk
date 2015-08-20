# package versions

# cross compiler

BINUTILS_VER = 2.24
# 2.25 build error
GMP_VER = 5.1.3
MPFR_VER = 3.1.3
MPC_VER = 1.0.2
ISL_VER = 0.11.1
# 0.11 need for binutils build
CLOOG_VER = 0.18.1
GCC_VER = 4.9.2
# 4.9.2 used: bug arm/62098 fixed

# core

KERNEL_VER = 3.19.6
# 2.6.x not used: bug eth/rtl8139
ULIBC_VER = 0.9.33.2
BUSYBOX_VER = 1.23.2
#1.22.1

# boot loaders

SYSLINUX_VER = 6.03
UBOOT_VER = 2015.04

# libs

## SDL2 not works with FB
SDL_VER = 1.2.15
SDL_IMAGE_VER = 1.2.12
SDL_TTF_VER = 2.0.11
SDL_SOUND_VER = 1.0.3
FREETYPE_VER = 2.5.5

## extra
ZLIB_VER = 1.2.8
PNG_VER = 1.6.15
PCRE_VER = 8.37

## math libs
BLAS_VER = 3.5.0
LAPACK_VER = 3.5.0
GSL_VER = 1.16

# multimedia
ALSA_VER = 1.0.26
#27+ ___tls_get_addr error

# extra

## SDK

### Python
PYTHON_VER = 2.7.9

### Pascal
FPC_VER = 2.6.4

## math packs
ECL_VER_A = 15.2
ECL_VER = $(ECL_VER_A).21
OCTAVE_VER = 3.8.2
MAXIMA_VER = 5.35.1
MPICH_VER = 3.1.4

# apps
LINKS_VER = 2.9
ELINKS_VER = 0.11.7

# X11R7.7
X_RELEASE = X11R7.7
X_SERVER_VER = 1.12.2

