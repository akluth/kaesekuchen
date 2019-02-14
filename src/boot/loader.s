; vim: ft=nasm
MAGIC_NUMBER    equ 0x1BADB002
FLAGS           equ 0x0
CHECKSUM        equ -MAGIC_NUMBER

section .multiboot
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

section .bss
align 16
stack_bottom:
    resb 32768
stack_top:

section .text
global _loader
_loader:
    mov esp, stack_top
    extern init
    call init
    cli
.hang: hlt
    jmp .hang
