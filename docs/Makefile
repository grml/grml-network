install_ = install
name_ = grml-network

etc = ${DESTDIR}/etc/
usr = ${DESTDIR}/usr
usrbin = $(usr)/bin
usrsbin = $(usr)/sbin
usrshare = $(usr)/share/$(name_)
usrdoc = $(usr)/share/doc/$(name_)
man8 = $(usr)/share/man/man8/
man1 = $(usr)/share/man/man1/


%.html : %.txt ;
	asciidoc -b xhtml11 $^

%.gz : %.txt ;
	asciidoc -d manpage -b docbook $^
	#sed -i 's/<emphasis role="strong">/<emphasis role="bold">/g' `echo $^ |sed -e 's/.txt/.xml/'`
	xsltproc -nonet /usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl `echo $^ |sed -e 's/.txt/.xml/'` &>/dev/null
	gzip -f --best `echo $^ |sed -e 's/.txt//'`


MANPAGES = grml-vnet.8

all: doc

doc: doc_man doc_html
doc_html: $(addsuffix .html, $(MANPAGES))
doc_man: $(addsuffix .gz, $(MANPAGES))


install: all
	# install .html dokumentation
	$(install_) -d -m 755 $(usrdoc)
	@for i in $(MANPAGES); do \
		$(install_) -vm 644 $$i.html $(usrdoc); done
	# install manpages
	$(install_) -d -m 755 $(man8)
	@for i in $(MANPAGES); do \
		$(install_) -vm 644 $$i.gz $(man8); done

clean:
	@for i in $(MANPAGES); do \
		rm -f $$i.html $$i.xml $$i.gz $$i; done

