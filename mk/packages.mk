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

# libs

SDL = SDL-$(SDL_VER)
# SDL = SDL2-$(SDL_VER) # can't cross compile SDL2

# extra
