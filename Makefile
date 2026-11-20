# Build the starter and the demonstration presentations.
#   make          download the logo if needed, then build both PDFs
#   make check    build, lint and check the logs (what CI runs)
#   make clean    remove generated files (keeps sources, fonts and the logo)
# SPDX-License-Identifier: MIT

LATEXMK ?= latexmk
LOGO := theme/logo/fusion-cdt-logo-white.pdf

.PHONY: all starter demo logo lint check clean

all: starter demo

logo: $(LOGO)

$(LOGO):
	sh scripts/fetch-logo.sh

starter: $(LOGO)
	cd starter && $(LATEXMK) main.tex

demo: $(LOGO)
	cd demo && $(LATEXMK) demo.tex

lint:
	chktex -q -l .chktexrc theme/beamerthemeFusionCDT.sty starter/main.tex demo/demo.tex

check: all lint
	sh scripts/check-logs.sh starter/main.log demo/demo.log

clean:
	cd starter && $(LATEXMK) -C main.tex
	cd demo && $(LATEXMK) -C demo.tex
