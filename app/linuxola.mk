# app: linuxola
LIBS = zlib png sdl alsa_lib sdl_sound
APPS = \
	$(USRBIN)/hello \
	$(USRBIN)/sdl_hello $(USRBIN)/sdl_rect $(USRBIN)/sdl_clock \
	$(USRBIN)/cpptest

QEMU_APPEND += vga=0x312
# 320x240 minimal video: cheapest TFT touch SPI LCD in plans
# 0x312 640x480x24: 320x00 not found
# 0x315 
QEMU_APP = 
