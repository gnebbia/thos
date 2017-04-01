.section .boot, "ax"

.global _thos_start
.extern thos_setup
.extern thos_main

_thos_start:
/* set the stack pointer */
;	mov r0, pc
;	sub r0, #12
;	mov sp, r0

	bl thos_setup
	bl thos_main
	b _thos_start

