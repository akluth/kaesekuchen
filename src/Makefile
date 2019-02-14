SRCS = $(shell find -name '*.[casm]')
OBJS = $(addsuffix .o,$(basename $(SRCS)))

AS = nasm
CC = gcc
LD = ld

ASFLAGS = -f elf32
CFLAGS = -m32 -Wall -g -fno-stack-protector -I include
LDFLAGS = -melf_i386 -Tkernel.ld

kaesekuchen: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

%.o: %.asm
	$(AS) $(ASFLAGS) -c -o $@ $^

clean:
	rm $(OBJS)

.PHONY: clean

