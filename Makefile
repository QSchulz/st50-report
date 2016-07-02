PICTURES =
PROJECT = st50-report.tex
COVER = cover.pdf

all: $(PICTURES) $(COVER)
	$(PDFLATEX_ENV) pdflatex -shell-escape $(PROJECT)

%.pdf: cover/%.odg
	libreoffice --convert-to pdf --outdir cover $^ --headless 

%.pdf: %.svg
	inkscape -D -A $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	$(RM) *.pdf *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log *.lof cover/*.pdf tex/*.aux tex/*.out tex/*.log tex/*.lof
