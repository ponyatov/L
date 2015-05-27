# [H]ard[W]are: qemu386 qemuARM qemuMIPS cubie1 rpi ...
HW = qemu386
#pc686: ILL bug
# [APP]lication: micro clock math desk ...
APP = math
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
	make coref
	make libs
	make apps
	make root
