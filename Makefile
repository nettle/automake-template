all: build

init      : GNUMakefile ## Initialize AC tools (aclocal, autoconf, automake, configure)
GNUMakefile: configure.ac GNUMakefile.am
	mkdir -p m4
	autoreconf --install --force --verbose
	./configure

reconf    : ## Reconfigure AC tools (autoreconf, configure)
	mkdir -p m4
	autoreconf --install --force --verbose
	./configure

clean-all : ## Remove all generated files
	rm -rf autom4te.cache
	rm -rf build-aux
	rm -rf m4
	rm -f aclocal.m4
	rm -f configure config.log config.status
	rm -f GNUMakefile.in GNUMakefile
	rm -f COPYING INSTALL
	rm -f src/*.o *.o
	rm -rf src/.deps .deps .libs
	rm -f src/.dirstamp .dirstamp libtool
	rm -f test

build     : GNUMakefile ## Build
	make -f GNUMakefile

help      : ## Show this help
	@echo Additional targets:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -r 's/(.*):.*##(.*)/   \1 -\2/'
