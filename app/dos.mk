# app: clock
LIBS = zlib png sdl
APPS = \
	$(USRBIN)/hello $(USRBIN)/cpptest \
	$(USRBIN)/sdl_hello $(USRBIN)/sdl_rect

QEMU_APPEND += vga=0x315
QEMU_APP = 
