.ONESHELL:

.PHONY: all
all: readme doc test cleanup

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-es-doc
	xelatex quran-es-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-es-test.tex
	cd sample || exit
	xelatex quran-es-test
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: dev
dev:
	cd tex || exit
	sudo mkdir -p /usr/local/texlive/2024/texmf-dist/tex/latex/quran-es
	sudo cp -v *.def quran-es.sty /usr/local/texlive/2024/texmf-dist/tex/latex/quran-es
	sudo mktexlsr

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran-es/doc quran-es/tex
	cp -v README        quran-es
	cd tex || exit
	cp -v quran-es.sty  ../quran-es/tex
	cp -v qurantext-es*.translation.def ../quran-es/tex
	cd ../doc/ || exit
	cp -v quran-es-doc.pdf quran-es-doc.tex quran.png ../quran-es/doc
	cd ../sample || exit
	cp -v quran-es-test*    ../quran-es/doc
	cd ..
	zip -r quran-es.zip quran-es
	mv -fv quran-es.zip ..
	rm -rfv ../quran-es
	mv -fv quran-es ..

QURANDATE := $(shell grep "quranesdate{" tex/quran-es.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "quranesversion{" tex/quran-es.sty | cut -d'{' -f2 | tr -d '}')
YEAR := "$(shell echo ${QURANDATE} | cut -d'/' -f1)"
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran-es package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This package is designed for typesetting select Spanish translations of the Holy Quran." >> "${readme-file}"
	@echo -e "It supports translations by \`Raúl González Bórnez\`, \`Julio Cortes\`, and \`Muhammad Isa García\`." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For further details, please refer to the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Release date of the current version: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © 2024" >> "${readme-file}"
	@echo "This package may be distributed and/or modified under the terms of the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or later (at your option). The latest version of" >> "${readme-file}"
	@echo "the license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work has the LPPL maintenance status 'author-maintained'." >> "${readme-file}"