
%.gen: generator.cma %.cmo 
	ocamlc $(OCFLAGS) -o $@ $+

generator.cma: rutil.cmo latex.cmo nroff.cmo html.cmo rtf.cmo main.cmo
	ocamlc $(OCFLAGS) -a -o $@ $+

%.cmo: %.ml
	ocamlc $(OCFLAGS) -c $<

%.cmi: %.mli
	ocamlc $(OCFLAGS) -c $<

.depend: *.ml *.mli
	ocamldep $+ | grep -v '\.cmx' > $@

sinclude .depend

tidy:
	-rm -f *.gen *.tex *.log *.aux *.dvi *.ps *.pdf *.nr *.tty *.ansi *.txt *.html *.rtf *~

clean: tidy
	-rm -f *.cm*

cleaner: clean
	-rm -f .depend
