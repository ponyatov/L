# normal
.PHONY: core
core: kernel ulibc ramclean gcc busybox ramclean

# with fortran (gccf)
.PHONY: coref
coref: kernel ulibc ramclean gccf busybox ramclean
