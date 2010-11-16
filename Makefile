# 
# makefile para a compilação do documento
#
# Sáb Jun 23 21:13:37 BRT 2007
#

BASE_NAME = tese
CAPITULOS = cap-introducao.tex \
	cap-construcao.tex \
	cap-propriedades.tex \
	cap-taxas.tex
APENDICES = 
BIB	  = bibliografia.bib

LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

pdf: $(BASE_NAME).pdf
ps: $(BASE_NAME).ps

$(BASE_NAME).pdf: $(BASE_NAME).tex $(CAPITULOS) $(APENDICES) $(BIB) 
	$(PDFLATEX) $<
	$(BIBTEX) $(BASE_NAME) 
	$(MAKEINDEX) $(BASE_NAME) 
	$(PDFLATEX) $< 
	$(PDFLATEX) $<
	$(PDFLATEX) $<

$(BASE_NAME).ps: $(BASE_NAME).tex $(CAPITULOS) $(APENDICES) $(BIB)
	$(LATEX) $<
	$(BIBTEX) $(BASE_NAME) 
	$(MAKEINDEX) $(BASE_NAME) 
	$(LATEX) $< 
	$(LATEX) $<
	$(LATEX) $<

clean:
	rm -f $(BASE_NAME)*.dvi *.log \
	      *.aux *.blg *.toc *.brf *.ilg *.ind \
	      $(BASE_NAME)*.bbl $(BASE_NAME)*.out \
	      $(BASE_NAME)*.lof $(BASE_NAME)*.lot $(BASE_NAME).idx \
	      _region_*   *~
	rm -fR auto/
