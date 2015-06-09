BOPT = -O2 -g0 -march=native -mtune=native 

#OPT_LTO = -flto
OPT_LTO =
# use LTO only for user apps: ulibc build with errors if -flto used
OPT_DEBUG = -g0
TOPT = -Ofast $(OPT_DEBUG) $(CFLAGS_CPU) -ffast-math $(OPT_LTO)
