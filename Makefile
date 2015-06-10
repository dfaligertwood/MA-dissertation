thesis.pdf: thesis.pdc.swp thesis.meta.yaml thesis.json thesis.xelatex
	pandoc -s -S --latex-engine=xelatex --template=thesis.xelatex --filter pandoc-filter-manager --chapters thesis.meta.yaml thesis.pdc.swp -o thesis.pdf

wordcount: thesis.pdc.swp
	wc thesis.pdc.swp

thesis.pdc.swp: thesis.md includes/*.pdc
	cat `cat thesis.md | sed -e 's/<<\[//' -e 's/\]//'` > thesis.pdc.swp

clean:
	rm *.pdf
	rm *.swp
