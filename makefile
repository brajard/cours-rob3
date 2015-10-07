#cours = intro
#dependancy = 

#cours = cours-1
#dependancy = algorithmes.tex turing.tex

#cours = cours-2
#dependancy = langageC.tex commentaires.tex variables.tex operateurs.tex forif.tex conversions.tex

#cours = cours-3
#dependancy = compilation.tex io.tex tableaux.tex

cours = cours-4
dependancy = fonctions.tex



all: online slides print

online: $(cours)_online.pdf
slides: $(cours)_slides.pdf
print: $(cours)_print.pdf

$(cours)_online.pdf: $(cours).tex $(dependancy)
	-pdflatex -interaction=nonstopmode  $<
	-pdflatex -interaction=nonstopmode  $<
	-pdflatex -interaction=nonstopmode  $<
	mv $(cours).pdf $@

$(cours)_slides.pdf: $(cours).tex $(dependancy)
	-pdflatex -interaction=nonstopmode  "\def\correction{1} \input{$<}" 
	-pdflatex -interaction=nonstopmode  "\def\correction{1} \input{$<}"
	-pdflatex -interaction=nonstopmode  "\def\correction{1} \input{$<}"
	mv $(cours).pdf $@


$(cours)_print.pdf: $(cours).tex $(dependancy)
	-pdflatex -interaction=nonstopmode "\def\ishandout{1} \input{$<}"
	-pdflatex -interaction=nonstopmode "\def\ishandout{1} \input{$<}"
	-pdflatex -interaction=nonstopmode "\def\ishandout{1} \input{$<}"
	mv $(cours).pdf $@

