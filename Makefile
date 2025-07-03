.PHONY: site
site:
	quarto render


BIBFILE=references.bib

# Format and sort bib file
.PHONY: bib
bib:
	bibtool -r biblatex -s --sort.format='{%s($type) %s($key)}' -i $(BIBFILE) -o $(BIBFILE)
	biber --tool --output-align --output-indent=2 --output-fieldcase=lower --output-field-order='author,names,title,dates,options,lists' --validate-config ${BIBFILE} -O ${BIBFILE} && rm "${BIBFILE}.blg"
