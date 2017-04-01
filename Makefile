CROSS_COMPILE ?= arm-linux-gnueabi-

AS              = $(CROSS_COMPILE)as
LD              = $(CROSS_COMPILE)ld
CC              = $(CROSS_COMPILE)gcc
CPP             = $(CC) -E
AR              = $(CROSS_COMPILE)ar
NM              = $(CROSS_COMPILE)nm
STRIP           = $(CROSS_COMPILE)strip
OBJCOPY         = $(CROSS_COMPILE)objcopy
OBJDUMP         = $(CROSS_COMPILE)objdump

ASFLAGS		= -march=armv7-m 
#ASFLAGS		= -march=armv7-m -mthumb -g -Wall
CFLAGS		= -Wall -ffreestanding -mthumb -march=armv7-m -ggdb -O2
LDFLAGS		= -T thos.lds


.PHONY: clean, upload

all: thos.bin

thos.bin: thos
	$(OBJCOPY) -O binary $^ $@

thos: boot.o main.o io.o
	$(LD) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o *~ *.bin thos
upload:
	tools/program thos.bin

#To disassemble the binary file is:
# objdump -m arm -b binary -D thos.bin
