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

    input1Msg: db 'Insira um numero: '
    lenInput1Msg: equ $ - input1Msg

    input2Msg: db 'Insira outro numero: '
    lenInput2Msg: equ $ - input2Msg

    ouputMsg: db 'Soma = '
    lenOutputMsg: equ $ - ouputMsg

    numberSize: equ 10

section .bss

    num1: resb numberSize
    num2: resb numberSize
    res: resb numberSize

section .text
    global _start

_start:

    mov ECX, input1Msg
    mov EDX, lenInput1Msg
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov ECX, num1
    mov EDX, numberSize
    mov EBX, SYS_FORK
    mov EAX, SYS_READ
    int 0x80

    mov ECX, input2Msg
    mov EDX, lenInput2Msg
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov ECX, num2
    mov EDX, numberSize
    mov EBX, SYS_FORK
    mov EAX, SYS_READ
    int 0x80

    ; MOVE O PRIMEIRO NUMERO PARA O EAX
    ; SUBTRAI O ASCII '0', DESSA FORMA CONVERTE PARA UM DECIMAL

    mov EAX, [num1]
    sub EAX, '0'

    ; MOVE O SEGUNDO NUMERO PARA O EBX
    ; CONVERTE PARA DECIMAL

    mov EBX, [num2]
    sub ebx, '0'

    ; SOMA OS NUMEROS

    add eax, ebx

    ; CONVERTE PARA ASCII
    add eax, '0'

    ; MOVE O RESULTADO DA SOMA
    mov [res], eax

    mov ECX, ouputMsg
    mov EDX, lenOutputMsg
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov ECX, res
    mov EDX, numberSize
    mov EBX, SYS_EXIT
    mov EAX, SYS_WRITE
    int 0x80

    mov EAX, SYS_EXIT
    int 0x80
