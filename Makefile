LATEX=xelatex
RUBY=ruby

.PHONY: default pdf distclean clean

default: pdf

pdf: stadgar.pdf reglemente.pdf ekonomiskt_styrdokument.pdf

stadgar.pdf: stadgar.tex
	$(LATEX) stadgar
	$(LATEX) stadgar

reglemente.pdf: reglemente.tex
	$(LATEX) reglemente
	$(LATEX) reglemente

ekonomiskt_styrdokument.pdf: ekonomiskt_styrdokument.tex
	$(LATEX) ekonomiskt_styrdokument
	$(LATEX) ekonomiskt_styrdokument

textile: stadgar.textile reglemente.textile ekonomiskt_styrdokument.textile

stadgar.textile:
	$(RUBY) textilize.rb stadgar.tex

reglemente.textile:
	$(RUBY) textilize.rb reglemente.tex

ekonomiskt_styrdokument.textile:
	$(RUBY) textilize.rb ekonomiskt_styrdokument.tex

toc: stadgar.toc.textile reglemente.toc.textile ekonomiskt_styrdokument.toc.textile

stadgar.toc.textile: stadgar.textile
	$(RUBY) toc_gen.rb stadgar.textile

reglemente.toc.textile: reglemente.textile
	$(RUBY) toc_gen.rb reglemente.textile

ekonomiskt_styrdokument.toc.textile: ekonomiskt_styrdokument.textile
	$(RUBY) toc_gen.rb ekonomiskt_styrdokument.textile

distclean: clean
	rm -f stadgar.pdf reglemente.pdf ekonomiskt_styrdokument.pdf

clean:
	rm -f *.aux *.log *.out *.textile
