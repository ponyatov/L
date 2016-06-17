# package versions

# cross compiler

BINUTILS_VER = 2.26
# 2.24 ok
# 2.25 build error
# 2.26 upgrade test
GCC_VER = 5.4.0
# 4.9.2 used: bug arm/62098 fixed
# 4.9.3 tested ok
# 5.4.0 upgrade test 
GMP_VER = 6.1.0
# 5.1.3 ok
# 6.1.0 upgrade test
MPFR_VER = 3.1.4
# 3.1.3 ok
# 3.1.4 upgrade test
MPC_VER = 1.0.3
# 1.0.2 ok
# 1.0.3 upgrade test
ISL_VER = 0.16.1
# 0.11.1 ok need for binutils 2.24 build
# 0.14 ok for binutils 2.26 / gcc 4.9.3
# 0.16.1 upgrade test 
CLOOG_VER = 0.18.1

# core

KERNEL_VER = 3.19.8
# 2.6.x not used: bug eth/rtl8139
# 3.19.6 ok
# 4.6.2 upgrade test for rpiB boot: cant boot
# 3.19.8 upgrade test (rpiB fallback)
ULIBC_VER = 0.9.33.2
BUSYBOX_VER = 1.23.2
#1.22.1

# boot loaders

SYSLINUX_VER = 6.03
UBOOT_VER = 2016.05

# libs

## SDL2 not works with FB
SDL_VER = 1.2.15
SDL_IMAGE_VER = 1.2.12
SDL_TTF_VER = 2.0.11
SDL_GFX_VER = 2.0.25
SDL_SOUND_VER = 1.0.3
FREETYPE_VER = 2.5.5
LIBGD_VER = 2.1.0
#2_0_30
#2_0_34RC1 & 2.1.1 no configure

## extra
ZLIB_VER = 1.2.8
PNG_VER = 1.6.15
PCRE_VER = 8.37
NCURSES_VER = 5.9

## math libs
BLAS_VER = 3.5.0
LAPACK_VER = 3.5.0
GSL_VER = 1.16

# math
GNUPLOT_VER = 4.6.7

# multimedia
ALSA_VER = 1.0.26
#27+ ___tls_get_addr error
MPLAYER_VER = 1.3.0

## codecs
FFMPEG_VER = 3.0
# 2.7.2
OGG_VER = 1.3.2
VORBIS_VER = 1.3.5
FLAC_VER = 1.3.1
SPEEX_VER = 1.2rc2

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

# TinyX (Xfree86 Xvesa Xfbdev)
XSERVER_VER = 4.8.0
