# app: math
LIBS = zlib pcre blas lapack 
APPS = hello cpptest octave

QEMU_APPEND += vga=5 OCTAVE_HOME=/octave
QEMU_APP = -m 256M -smp 4
