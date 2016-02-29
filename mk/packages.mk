# software packages

# [c]ross [c]ompiler

BINUTILS	= binutils-$(BINUTILS_VER)
GMP			= gmp-$(GMP_VER)
MPFR		= mpfr-$(MPFR_VER)
ISL			= isl-$(ISL_VER)
CLOOG		= cloog-$(CLOOG_VER)
MPC 		= mpc-$(MPC_VER)
GCC 		= gcc-$(GCC_VER)

# core

KERNEL 		= linux-$(KERNEL_VER)
ULIBC 		= uClibc-$(ULIBC_VER)
BUSYBOX 	= busybox-$(BUSYBOX_VER)

# loaders

SYSLINUX 	= syslinux-$(SYSLINUX_VER)
UBOOT 		= u-boot-$(UBOOT_VER)

# libs

## SDL2 not works with FB
SDL 		= SDL-$(SDL_VER)
SDL_IMAGE 	= SDL_image-$(SDL_IMAGE_VER)
SDL_TTF 	= SDL_ttf-$(SDL_TTF_VER)
SDL_GFX		= SDL_gfx-$(SDL_GFX_VER)
SDL_SOUND	= SDL_sound-$(SDL_SOUND_VER)

# multimedia
ALSA_LIB	= alsa-lib-$(ALSA_VER)
ALSA_UTILS	= alsa-utils-$(ALSA_VER)
MPLAYER		= MPlayer-$(MPLAYER_VER)
## codecs
FFMPEG		= ffmpeg-$(FFMPEG_VER)
OGG			= libogg-$(OGG_VER)
VORBIS		= libvorbis-$(VORBIS_VER)
FLAC		= flac-$(FLAC_VER)
SPEEX		= speex-$(SPEEX_VER)

## extra
ZLIB 		= zlib-$(ZLIB_VER)
PNG 		= libpng-$(PNG_VER)
FREETYPE 	= freetype-$(FREETYPE_VER)
LIBGD		= gd-$(LIBGD_VER)
#GD_$(LIBGD_VER)
NCURSES		= ncurses-$(NCURSES_VER)

## math
PCRE 		= pcre-$(PCRE_VER)
BLAS 		= BLAS
LAPACK 		= lapack-$(LAPACK_VER)
GSL			= gsl-$(GSL_VER)
GNUPLOT		= gnuplot-$(GNUPLOT_VER)

# extra
## SDK

### Python
PYTHON 		= Python-$(PYTHON_VER)

### PASCAL
FPC 		= fpc-$(FPC_VER)

# math
ECL 		= ecl-$(ECL_VER)
OCTAVE 		= octave-$(OCTAVE_VER)
MAXIMA 		= maxima-$(MAXIMA_VER)
MPICH		= mpich-$(MPICH_VER)
HYDRA		= hydra-$(MPICH_VER)

# apps
LINKS 		= links-$(LINKS_VER)
ELINKS 		= elinks-$(ELINKS_VER)

# TinyX (Xfree86 Xvesa Xfbdev)
XSERVER		= XFree86-$(XSERVER_VER)
