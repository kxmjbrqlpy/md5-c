CC = gcc

CFLAGS = -Wall -Wextra -O3

all: md5 md5-lib

md5: md5.c main.c
	@$(CC) $(CFLAGS) -o md5 md5.c main.c

clean:
	@$(RM) md5 md5.o libmd5.a

md5-lib: libmd5.a

libmd5.a: md5.o	
	$(AR) crv $@ md5.o

install:
	mkdir -p $(DESTDIR)/lib/
	mkdir -p $(DESTDIR)/include/
	mkdir -p $(DESTDIR)/bin/
	cp libmd5.a $(DESTDIR)/lib/
	cp md5.h $(DESTDIR)/include
	cp md5 $(DESTDIR)/bin
