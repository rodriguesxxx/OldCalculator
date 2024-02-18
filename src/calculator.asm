;*************************************************
;           
;                  OLD CALCULATOR
;
;Date: 02/18/2024
;Author: Daniel Rodrigues Pereira
;OS: Pop!_OS 22.04 LTS
;Kernel: Linux 6.6.6
;Compiler: NASM 2.16.01
;Version: 1.0
;Description: Calculator made in assembly, with basic arithmetic operations and conversion from decimal to binary and vice versa
;Repository: https://github.com/rodriguesxxx/OldCalculator
;
;*************************************************

section .data

    RET_EXIT equ 0x0
    STD_OUT equ 0x1

    SYS_WRITE equ 0x4
    SYS_EXIT equ 0x1

    message: db 'Hello world'
    len: equ $ - message

section .text

    global _start

_start:

    mov ECX, message
    mov EDX, len
    mov EBX, STD_OUT
    mov EAX, SYS_WRITE
    int 0x80

    mov EAX, SYS_EXIT
    int 0x80