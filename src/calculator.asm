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

    SYS_EXIT equ 0x1
    SYS_FORK equ 0x2
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4
    
    LINE_BREAK equ 0xA

    inputMsg: db 'Insira um numero: '
    lenInputMsg: equ $ - inputMsg
    ouputMsg: db 'Você inseriu o numero: '
    lenOutputMsg: equ $ - ouputMsg
    numberSize: equ 5

section .bss

    num: resb numberSize

section .text
    global _start

_start:

    mov ECX, inputMsg
    mov EDX, lenInputMsg
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov ECX, num
    mov EDX, numberSize
    mov EBX, SYS_FORK
    mov EAX, SYS_READ
    int 0x80

    mov ECX, ouputMsg
    mov EDX, lenOutputMsg
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov ECX, num
    mov EDX, numberSize
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov EAX, SYS_EXIT
    int 0x80