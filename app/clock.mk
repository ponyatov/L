# app: clock
LIBS = zlib png sdl
APPS = \
	$(USRBIN)/hello $(USRBIN)/cpptest \
	$(USRBIN)/sdl_hello $(USRBIN)/sdl_rect $(USRBIN)/sdl_clock

QEMU_APPEND += vga=0x315
QEMU_APP = 
