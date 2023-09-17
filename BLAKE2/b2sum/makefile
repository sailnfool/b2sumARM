PROG=b2sum
PREFIX?=/usr/local
MANDIR?=$(PREFIX)/man
NO_OPENMP?=0
NO_OPENMP_0=-fopenmp
NO_OPENMP_1=
CC?=gcc
CFLAGS?=-O3 -march=native
CFLAGS+=-std=c89 -Wall -Wextra -pedantic -Wno-long-long 
CFLAGS_SSE=-I../sse
CFLAGS_NEON=-I../neon
CFLAGS_REF=-I../ref
CFLAGS+=$(NO_OPENMP_$(NO_OPENMP))
LIBS=

FILES_SSE=b2sum.c ../sse/blake2b.c ../sse/blake2s.c ../sse/blake2bp.c ../sse/blake2sp.c

##########
# Hoping that someone will create a NEON implementation
##########
FILES_NEON=b2sum.c ../neon/blake2b.c ../neon/blake2s.c ../neon/blake2bp.c ../neon/blake2sp.c

FILES_REF=b2sum.c ../ref/blake2b-ref.c ../ref/blake2s-ref.c ../ref/blake2bp-ref.c ../ref/blake2sp-ref.c

i86pc=$(FILES_SSE)
i.86=$(FILES_SSE)
amd64=$(FILES_SSE)
x86_64=$(FILES_SSE)
armv6l=$(FILES_REF)
armv7l=$(FILES_NEON)
aarch64=$(FILES_NEON)

#########
# Add additional architectures as needed
##########
i86pc.inc=$(CFLAGS_SSE)
i.86.inc=$(CFLAGS_SSE)
amd64.inc=$(CFLAGS_SSE)
x86_64.inc=$(CFLAGS_SSE)
aarch64.inc=$(CFLAGS_NEON)

#########
# Add additional architectures as needed
##########
armv6l.inc=$(CFLAGS_REF)
armv7l.inc=$(CFLAGS_NEON)
aarch64.inc=$(CFLAGS_NEON)

ARCH=$(shell uname -m)
ARCHINC=$(ARCH).inc

FILES=$($(ARCH))
CFLAGS+=$($(ARCHINC))

all: $(FILES)
	$(CC) $(FILES) $(CFLAGS) $(LIBS) -o $(PROG)

clean:
	rm -f $(PROG)

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(MANDIR)/man1
	install -m 755 $(PROG) $(DESTDIR)$(PREFIX)/bin
	install -m 644 b2sum.1 $(DESTDIR)$(MANDIR)/man1/$(PROG).1
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROG) $(DESTDIR)$(MANDIR)/man1/$(PROG).1

