SOURCES=src/intro.md src/review.md src/automata_model.md src/state_approximation.md src/outro.md

all: clean to_tex copy_template build_pdf

to_tex:
	pandoc -i $(SOURCES) -o bin/main.tex

copy_template:
	copy template/dissertation.tex bin/dissertation.tex

build_pdf:
	cmd /c "cd bin && pdflatex dissertation.tex"
clean:
	del bin\*.tex