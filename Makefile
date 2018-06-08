SOURCES=src/intro.md src/review.md src/automata_model.md src/state_approximation.md src/outro.md

all: clean build_pdf build_epub build_docx

copy_template:
	copy template/dissertation.tex bin/dissertation.tex

copy_biblio:
	copy biblio/biblio.bib bin/biblio.bib

to_tex: copy_template copy_biblio copy_template
	pandoc -i $(SOURCES) -o bin/main.tex

build_pdf: to_tex 
	cmd /c "cd bin && pdflatex dissertation.tex && bibtex dissertation.aux && pdflatex dissertation.tex && pdflatex dissertation.tex"

build_epub: to_tex 
	cmd /c "cd bin && pandoc -s --webtex --csl gost.csl --bibliography biblio.bib --filter pandoc-citeproc -i dissertation.tex -o dissertation.epub"

build_docx: to_tex
	cmd /c "cd bin && pandoc -s --csl gost.csl --bibliography biblio.bib --filter pandoc-citeproc -i dissertation.tex -o dissertation.docx"

remove_tmp:
	del bin\*.tex bin\*.bak bin\*.sav bin\*.aux bin\*.blg bin\*.bbl bin\*.log bin\*.out bin\*.toc bin\*.bib

clean: remove_tmp
	del bin\*.pdf bin\*.epub bin\*.docx
	