# app: linuxola
LIBS = zlib png sdl
APPS = \
	$(USRBIN)/hello \
	$(USRBIN)/sdl_hello $(USRBIN)/sdl_rect $(USRBIN)/sdl_clock \
	$(USRBIN)/cpptest

QEMU_APPEND += vga=ask
# 320x240 minimal video: cheapest TFT touch SPI LCD in plans
#0x315
QEMU_APP = 
