SOURCES=src/intro.md src/review.md src/automata_model.md src/state_approximation.md src/outro.md 

all: remove_outs build_pdf clean

remove_outs:
	del *.pdf *.docx *.epub

build_pdf:
	cmd /c "pdflatex dissertation.tex && bibtex dissertation.aux && pdflatex dissertation.tex && pdflatex dissertation.tex"

clean:
	del *.log *.aux *.bbl *.blg *.lof *.lot *.out *.toc

build_epub:
	pandoc -s --webtex -i dissertation.tex -o dissertation.epub

build_docx:
	pandoc -s -i dissertation.tex -o dissertation.docx
	