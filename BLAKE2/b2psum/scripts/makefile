SHELL=/bin/bash
PREFIX?=$(HOME)
LPREFIX?=/usr/local
.sh:
	@rm -f $@
	cp $< $@
INSTALL =		b2ppsum

EXECDIR := $(PREFIX)/bin
EXECDIR2 := $(PREFIX2)/bin
LEXECDIR := $(LPREFIX)/bin


.PHONY: clean uninstall all
all: $(INSTALL)
install: $(INSTALL)
	mkdir -p $(EXECDIR)
	install -o $(USER) -C $? $(EXECDIR)
	rm -f $?
linstall: $(INSTALL)
	mkdir -p $(LEXECDIR)
	install -o $(USER) -C $? $(LEXECDIR)
clean: 
	@for execfile in $(INSTALL); do \
		echo rm -f $$execfile; \
		rm -f $$execfile; \
	done
uninstall: 
	@for execfile in $(INSTALL); do \
		echo rm -f $(EXECDIR)/$$execfile; \
		rm -f $(EXECDIR)/$$execfile; \
	done
luninstall: 
	@for execfile in $(INSTALL); do \
		echo rm -f $(LEXECDIR)/$$execfile; \
		rm -f $(LEXECDIR)/$$execfile; \
	done
$(EXECDIR):
	mkdir -p $(EXECDIR)
$(LEXECDIR):
	mkdir -p $(LEXECDIR)
