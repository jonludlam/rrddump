.PHONY: all clean install build uninstall
all: build

BINDIR ?= /usr/bin

export OCAMLRUNPARAM=b

build: dist/setup
	obuild build

dist/setup: rrddump.obuild
	obuild configure

install:
	install -D ./dist/build/rrddump/rrddump $(DESTDIR)/$(BINDIR)/rrddump

uninstall:
	rm -f $(DESTDIR)/$(BINDIR)/rrddump

clean:
	@obuild clean
