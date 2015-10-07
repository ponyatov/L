# normal
.PHONY: core
core:
	make kernel$(VENDOR)
	make ulibc
	make ramclean
	make gcc
	make busybox
	make ramclean

# with fortran (gccf)
.PHONY: coref
coref: 
	make kernel$(VENDOR) 
	make ulibc 
	make ramclean 
	make gccf 
	make busybox 
	make ramclean
