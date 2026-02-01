
BINDIR=bin
.phony: all clean ${BINDIR}

all:
SRCDIR=src
OBJECTS=${SRCDIR}/main-banker.o ${SRCDIR}/banker.o
CXXFLAGS=-g -Wall
LDFLAGS=-lyaml-cpp

all: ${BINDIR}/main-banker

${BINDIR}/main-banker: ${OBJECTS} ${BINDIR}
	g++ -o $@ ${OBJECTS} ${LDFLAGS}

${BINDIR}:
	mkdir bin

${SRCDIR}/main-banker.o: ${SRCDIR}/main-banker.cpp ${SRCDIR}/banker.h

${SRCDIR}/banker.o: ${SRCDIR}/banker.cpp ${SRCDIR}/banker.h

clean:
	rm -R -f ${SRCDIR}/*.o ${SRCDIR}/*~
	rm -R -f ${BINDIR}
