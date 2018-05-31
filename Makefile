SOURCES=src/intro.md src/review.md src/automata_model.md src/state_approximation.md src/outro.md

all: clean build_pdf build_epub

to_tex:
	pandoc -i $(SOURCES) -o bin/main.tex

copy_template:
	copy template/dissertation.tex bin/dissertation.tex

build_pdf: to_tex copy_template
	cmd /c "cd bin && pdflatex dissertation.tex"

build_epub: to_tex copy_template
	cmd /c "cd bin && pandoc -i dissertation.tex -o dissertation.epub"

clean:
	del bin\*.tex