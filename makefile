#cours = intro
#dependancy = 

#cours = cours-1
#dependancy = algorithmes.tex turing.tex

cours = cours-2
dependancy = langageC.tex commentaires.tex variables.tex operateurs.tex forif.tex conversions.tex

all: online slides print

online: $(cours)_online.pdf
slides: $(cours)_slides.pdf
print: $(cours)_print.pdf

$(cours)_online.pdf: $(cours).tex $(dependancy)
	pdflatex $<
	pdflatex $<
	pdflatex $<
	mv $(cours).pdf $@

$(cours)_slides.pdf: $(cours).tex $(dependancy)
	pdflatex "\def\correction{1} \input{$<}" 
	pdflatex "\def\correction{1} \input{$<}"
	pdflatex "\def\correction{1} \input{$<}"
	mv $(cours).pdf $@


$(cours)_print.pdf: $(cours).tex $(dependancy)
	pdflatex "\def\ishandout{1} \input{$<}"
	pdflatex "\def\ishandout{1} \input{$<}"
	pdflatex "\def\ishandout{1} \input{$<}"
	mv $(cours).pdf $@

