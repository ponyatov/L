# app: clock
LIBS = zlib png sdl
APPS = \
	$(USRBIN)/hello \
	$(USRBIN)/sdl_hello $(USRBIN)/sdl_rect $(USRBIN)/sdl_clock
#	$(USRBIN)/cpptest 

QEMU_APPEND += vga=0x312
QEMU_APP = 
