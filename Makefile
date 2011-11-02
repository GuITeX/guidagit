##### Variabili
SHELL			= /bin/sh
PRINCIPALE		= git4latex
PRINCIPALE_TEX		= $(PRINCIPALE).tex
PRINCIPALE_PDF		= $(PRINCIPALE).pdf
CLEAN_FILE		= *.aux *.fdb_latexmk *.log *.out *.toc *~
DISTCLEAN_FILE		= $(PRINCIPALE_PDF)

##### Regole
.PHONY: pdf clean distclean dist

pdf: $(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(PRINCIPALE_TEX)
	latexmk -pdf $(PRINCIPALE_TEX)

# Per fare pulizia dei file temporanei generati:
clean:
	rm -f $(CLEAN_FILE)

# Per cancellare tutti i file generati nella compilazione lasciando solo il sorgente:
distclean: clean
	rm -f $(DISTCLEAN_FILE)

# Per creare un archivio compresso contenente il sorgente e il repository di git:
dist: distclean
	git gc # comprimiamo il repository locale di git per ridurre al minimo la tarball
	cd ..; tar -czvpsf $(PRINCIPALE).tar.gz $(PRINCIPALE)/
