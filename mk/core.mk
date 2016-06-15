# normal
.PHONY: core
core:
	make kernel
	make ulibc
	make ramclean
	make gcc
	make busybox
	make ramclean

# with fortran (gccf)
.PHONY: coref
coref: 
	make kernel 
	make ulibc 
	make ramclean 
	make gccf 
	make busybox 
	make ramclean
