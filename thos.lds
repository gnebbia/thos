OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_thos_start)

regs = 0;

SECTIONS
{
	. = 0x10000400;
	.text : {
		*(.boot) 
		*(.text)
	}

	.rodata : {*(.rodata)}
	.data	: { *(.data)   }
	.bss	: { *(.bss)    }
}

