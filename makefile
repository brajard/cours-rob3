#cours = intro
#dependancy = 

#cours = cours-1
#dependancy = algorithmes.tex

cours = cours-2
dependancy = langageC.tex commentaires.tex variables.tex operateurs.tex forif.tex conversions.tex

#cours = cours-3
#dependancy = compilation.tex io.tex tableaux.tex

#cours = cours-4
#dependancy = fonctions.tex parametres.tex tabfonc.tex recurs.tex stdfonc.tex

#cours = cours-5
#dependancy = string.tex point-add.tex point-tab.tex point-param.tex

#cours = cours-6
#dependancy = struct.tex struct-other.tex struct-list.tex debug.tex

#cours = cours-7
#dependancy = mainparam.tex modulaire.tex makefile.tex fichiers.tex

#cours = cours-8
#dependancy = minimax.tex

#cours = cours-9
#dependancy = nombres.tex perceptron.tex


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

