.PHONY: libs
libs: $(LIBS)

include mk/lib/zlib.mk
include mk/lib/png.mk
include mk/lib/sdl.mk
