TEXFILE = manuscript
paper:
	xelatex $(TEXFILE).tex
	bibtex *.aux
	xelatex $(TEXFILE).tex
	xelatex $(TEXFILE).tex
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls

submission:
	latex $(TEXFILE).tex
	bibtex *.aux
	latex $(TEXFILE).tex
	dvips -Ppdf $(TEXFILE).dvi
	ps2pdf $(TEXFILE).ps
	rm -fv *.ps *.dvi *.fdb_latexmk *.fls
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml

view:
	evince $(TEXFILE).pdf &

clean:
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls
	rm -fv *.pdf
