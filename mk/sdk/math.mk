
CFG_ECL =

.PHONY: ecl
ecl: $(SRC)/$(ECL)/README
	cd $(SRC)/$(ECL) && $(XPATH) ./$(BCFG) $(CFG_ECL) && $(MAKE)

CFG_OCTAVE =
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README

CFG_MAXIMA =
.PHONY: maxima
maxima: $(SRC)/$(MAXIMA)/README
