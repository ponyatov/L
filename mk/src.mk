# rules for src unpacking
$(SRC)/%/README: $(GZ)/%.tar.gz
	cd $(SRC) &&  zcat $< | tar x && touch $@
$(SRC)/%/README: $(GZ)/%.tar.bz2
	cd $(SRC) && bzcat $< | tar x && touch $@
$(SRC)/%/README: $(GZ)/%.tar.xz
	cd $(SRC) && xzcat $< | tar x && touch $@
$(SRC)/%/README: $(GZ)/%.tgz
	cd $(SRC) &&  zcat $< | tar x && touch $@
$(SRC)/BLAS/README: $(GZ)/blas.tgz
	cd $(SRC) &&  zcat $< | tar x && touch $@
$(SRC)/ATLAS/README: $(GZ)/$(ATLAS).tar.bz2
	cd $(SRC) && bzcat $< | tar x && touch $@
