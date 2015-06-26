package=gt-userscripts
prefix=/usr/local
bindir=$(prefix)/bin
datadir=$(prefix)/share
docdir=$(datadir)/doc/$(package)

bin_SCRIPTS=`ls gt-*`
doc_DATA=CONTRIBUTORS LICENSE README.md

all:

clean:

install:
	install -d $(DESTDIR)$(bindir)
	install $(bin_SCRIPTS) $(DESTDIR)$(bindir)
	install -d $(DESTDIR)$(docdir)
	install $(doc_DATA) $(DESTDIR)$(docdir)

.PHONY: all clean install readme

readme:
	cp README.md.in README.md
	for f in ${bin_SCRIPTS} ; do \
 	 echo "### $$f" >> README.md; \
	  echo '```' >> README.md; \
	  ./$$f -h >> README.md; \
	  echo '```' >> README.md; \
	done
