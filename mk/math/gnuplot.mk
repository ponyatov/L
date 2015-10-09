CFG_GNUPLOT = --disable-wxwidgets --disable-history-file

.PHONY: gnuplot
gnuplot: $(SRC)/$(GNUPLOT)/README
	rm -rf $(TMP)/$(GNUPLOT) && mkdir $(TMP)/$(GNUPLOT) && \
	cd $(TMP)/$(GNUPLOT) &&\
	$(XPATH) $(SRC)/$(GNUPLOT)/$(TCFG) $(CFG_GNUPLOT)
