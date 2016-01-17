all: document.pdf

document.pdf: clean document.tex
	pdflatex document
	bibtex document
	pdflatex document
	pdflatex document
	pdflatex document

.PHONY: clean

clean: 
	rm -f document.aux document.bbl document.blg document.dvi document.log document.out document.pdf
watch:
	while :; do  inotifywait -e modify document.tex document.bib; make; done
