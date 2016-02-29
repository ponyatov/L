.PHONY: tetris yetris
tetris: yetris

yetris:
#	rm -rf $(TMP)/yetris
#	cd $(TMP) ; git clone --depth=1 https://github.com/alexdantas/yetris.git
	cd $(TMP)/yetris && $(MAKE) V=2 clean &&\
	$(MAKE) V=2 CXX=$(TARGET)-g++
#	V=2 PREFIX=\"$(TMP)/yetroot\" 