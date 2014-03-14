PRINCIPALE         = IntroTikZmark
PRINCIPALE_TEX     = $(PRINCIPALE).tex
PRINCIPALE_PDF     = $(PRINCIPALE).pdf
PACCHETTI_COMANDI  = $(wildcard pacchetti_comandi/*.tex)
CAPITOLI           = $(wildcard chapters/*.tex)
IMMAGINI_TIKZ      = $(wildcard sorgtikz/*.tex)
IMMAGINI_TIKZ_PDF  = $(patsubst sorgtikz/%.tex, sorgtikz/%.pdf, $(IMMAGINI_TIKZ))
IMMAGINI_CROP      = $(wildcard sorgcrop/*.tex)
IMMAGINI_CROP_PDF  = $(patsubst sorgcrop/%.tex, sorgcrop/%.pdf, $(IMMAGINI_CROP))
FILE_CLEAN         = *.aux *.log *.out *.lof *.toc \
                     $(wildcard sorgtikz/*.out) \
                     $(wildcard sorgtikz/*.log) \
                     $(wildcard sorgtikz/*.aux) \
                     $(wildcard sorgtikz/*.toc) \
                     $(wildcard sorgtikz/*.snm) \
                     $(wildcard sorgtikz/*.nav) \
                     $(wildcard sorgcrop/*.out) \
                     $(wildcard sorgcrop/*.log) \
                     $(wildcard sorgcrop/*.aux)
FILE_DISTCLEAN     = $(IMMAGINI_TIKZ_PDF) $(wildcard sorgcrop/*.pdf)
TUTTI_LATEX        = $(PRINCIPALE_TEX) $(CAPITOLI) $(PACCHETTI_COMANDI)
                 
.PHONY: pdf distclean clean

IntroTikZmark: $(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(TUTTI_LATEX) $(IMMAGINI_TIKZ_PDF) crop
	pdflatex $(PRINCIPALE)
	pdflatex $(PRINCIPALE)
	
sorgtikz/%.pdf: sorgtikz/%.tex
	cd sorgtikz ; pdflatex $(shell basename $<) ; pdflatex $(shell basename $<)
	
sorgcrop/%.pdf: sorgcrop/%.tex
	cd sorgcrop ; pdflatex $(shell basename $<) ; pdflatex $(shell basename $<)
	
crop: $(IMMAGINI_CROP_PDF)
	cd sorgcrop ; ./crop.sh

distclean : clean
	rm -f $(FILE_DISTCLEAN)

clean:
	rm -f $(FILE_CLEAN)
	
cleanall : distclean
	rm -f $(PRINCIPALE_PDF)
    