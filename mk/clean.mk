.PHONY: ramclean
ramclean:
	$(RAMCLEAN) $(SRC)/* $(TMP)/* ~/.ccache/*

.PHONY: distclean
distclean: ramclean
	$(RAMCLEAN) $(ROOT) $(TC)
	make dirs
