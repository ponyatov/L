.PHONY: libs
libs: $(LIBS)

include mk/lib/zlib.mk
include mk/lib/png.mk
include mk/lib/sdl.mk
include mk/lib/freetype.mk
include mk/lib/multiprecision.mk
include mk/lib/cpp.mk
