CC=gcc
CFLAGS=-I.
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

PREFIX=/usr/bin

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

ebuild_test: $(OBJ)
	$(CC) -o ebuild_test $(OBJ)

.PHONY: clean
clean:
	rm -f $(OBJ) ebuild_test

.PHONY: install
install: ebuild_test
	mkdir -p $(DESTDIR)$(PREFIX)
	cp $< $(DESTDIR)$(PREFIX)/ebuild_test

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/ebuild_test
