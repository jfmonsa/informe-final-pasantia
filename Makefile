.PHONY: clean_tex compile compile_project update_deps update_dependencies

clean_tex:
	rm -f *.aux *.lof *.bbl *.blg *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz *.dvi *.lof *.lot *.run.xml *.bcf

compile: compile_project

compile_project:
	pdflatex anteproyecto-jfmonsa.tex
	biber anteproyecto-jfmonsa
	pdflatex anteproyecto-jfmonsa.tex
	pdflatex anteproyecto-jfmonsa.tex

update_deps: update_dependencies

update_dependencies:
	tlmgr update --self --all
	tlmgr path add
