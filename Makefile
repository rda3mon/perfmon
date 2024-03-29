BUILDDIR ?= ./dist
EXECUTABLE ?= perfmon
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
PYTHON ?= /usr/bin/env python3

all: perfmon

install:
	install $(BUILDDIR)/$(EXECUTABLE) $(DESTDIR)$(BINDIR)
	chmod +x $(DESTDIR)$(BINDIR)/$(EXECUTABLE)

perfmon: perfmon/*.py
	mkdir -p $(BUILDDIR)
	mkdir -p $(BUILDDIR)/zip
	for d in perfmon ; do \
		mkdir -p $(BUILDDIR)/zip/$$d ;\
		cp -pPR $$d/*.py $(BUILDDIR)/zip/$$d/ ;\
	done
	mv $(BUILDDIR)/zip/$(EXECUTABLE)/__main__.py $(BUILDDIR)/zip/
	cd $(BUILDDIR)/zip ; zip -q ../$(EXECUTABLE) $(EXECUTABLE)/*.py __main__.py
	rm -rf $(BUILDDIR)/zip
	echo '#!$(PYTHON)' > $(BUILDDIR)/$(EXECUTABLE)
	cat $(BUILDDIR)/$(EXECUTABLE).zip >> $(BUILDDIR)/$(EXECUTABLE)
	rm $(BUILDDIR)/$(EXECUTABLE).zip
	chmod a+x $(BUILDDIR)/$(EXECUTABLE)

clean:
	rm -rf MANIFEST $(BUILDDIR)
	find . -name "*.pyc" -delete


.PHONY: all clean install perfmon 
