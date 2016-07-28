# package versions

# cross compiler

BINUTILS_VER = 2.26.1
#2.24
# 2.25 build error
GMP_VER = 6.1.1
#5.1.3
MPFR_VER = 3.1.4
#3.1.3
MPC_VER = 1.0.3
#1.0.2
CLOOG_VER = 0.18.1
ISL_VER = 0.16.1
#0.11.1
# 0.11 need for binutils build
GCC_VER = 5.4.0
#4.9.3
# -> 5.4.0
#4.9.2
# 4.9.2 used: bug arm/62098 fixed

# core

KERNEL_VER = 3.19.8
#3.19.6
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
SDL_GFX_VER = 2.0.25
SDL_SOUND_VER = 1.0.3
FREETYPE_VER = 2.5.5
#2.1.1 not configure

## extra
ZLIB_VER = 1.2.8
PNG_VER = 1.6.15
PCRE_VER = 8.37
LIBGD_VER = 2.0.34

# multimedia
ALSA_VER = 1.0.26
#27+ ___tls_get_addr error

## codecs
FFMPEG_VER = 2.7.2

# extra

## SDK

# dos
DOSEMU_VER = 1.4.0
DOSBOX_VER = 0.74
BOCHS_VER = 2.6.8
FREEDOS_VER = 1.0
