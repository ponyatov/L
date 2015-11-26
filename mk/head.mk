# [H]ard[W]are: rpiB x86 vc1 ...
HW = vc1
# [APP]lication: micro clock math desk hobot ...
APP = hobot
# load extra hw definitions: ARCH CPU ...
include hw/$(HW).mk
# load extra defs for CPU setted in $(HW).mk
include cpu/$(CPU).mk
# load extra defs for ARCHitecture setted in $(CPU).mk
include arch/$(ARCH).mk
# load extra app defs: LIBS APPS ...
include app/$(APP).mk

.PNONY: all
all: 
	make dirs 
	make gz 
	make cross0
	make core
	make libs
	make apps
	make root
