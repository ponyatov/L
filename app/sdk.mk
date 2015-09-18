# app: linuxola
LIBS = zlib 
# png sdl alsa_lib ffmpeg sdl_sound
APPS = \
	$(USRBIN)/hello \
	$(USRBIN)/cpptest

QEMU_APPEND += vga=0x315
# 320x240 minimal video: cheapest TFT touch SPI LCD in plans
# 0x312 640x480x24: 320x00 not found
# 0x315 800x600x24
QEMU_APP = 
