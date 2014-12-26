.PHONY: ramclean
ramclean:
	rm -rf $(SRC)/* $(TMP)/* ~/.ccache/*

.PHONY: distclean
distclean: ramclean
	rm -rf $(ROOT) $(TC)
	make dirs
