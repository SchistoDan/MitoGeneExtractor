# CFLAGS  = -g3 -ggdb -Wall -std=c++11
CFLAGS = -O2 -std=c++11 -Wno-alloc-size-larger-than # -Wall

# Compiler and installation prefix can be overridden from the environment
# (e.g. by conda/bioconda, which sets $(CXX) and expects $(PREFIX)).
CXX     ?= g++
PREFIX  ?= /usr/local
BINDIR   = $(DESTDIR)$(PREFIX)/bin

VERSION = 1.9.6
TARGET  = MitoGeneExtractor-v$(VERSION)

INCL =    -I . -I tclap-1.2.5/include
#LIBS    = -lc -Wall

SRC    = MitoGeneExtractor.cpp \
	 global-types-and-parameters_MitoGeneExtractor.cpp \
         exonerate_wrapper_and_parser.cpp

HEADER = CDnaString3.h CSequence_Mol3.1.h CSequences3.1.h CSplit2.h Ctriple.h \
         basic-DNA-RNA-AA-routines.h fast-realloc-vector.h faststring3.h \
         global-types-and-parameters_MitoGeneExtractor.h primefactors.h statistic_functions.h \
         exonerate_wrapper_and_parser.hpp Cfastq-sequences3.1.h


all:    $(TARGET)


$(TARGET): $(SRC) $(HEADER)
	$(CXX) $(CPPFLAGS) $(CFLAGS) $(CXXFLAGS) $(INCL) $(SRC) $(LDFLAGS) -o $(TARGET)

# Install the versioned binary and a stable "MitoGeneExtractor" command name.
install: $(TARGET)
	install -d $(BINDIR)
	install -m 0755 $(TARGET) $(BINDIR)/
	ln -sf $(TARGET) $(BINDIR)/MitoGeneExtractor

clean:
	rm -f $(TARGET)

.PHONY: all install clean
