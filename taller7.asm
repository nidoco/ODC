section .data
    num1 db 1                ; Valor base para sumar
    num2 db 1                ; Otro valor base
    result db 0              ; Donde se almacena el resultado
    msg db 'Caracter: ', 0   ; Mensaje a imprimir antes de cada caracter

section .bss
    buffer resb 4            ; Reservar 4 bytes en el buffer

section .text
    global _start

_start:
    ; Imprimir el carácter 'A'
    mov al, [num1]
    add al, [num2]           ; 1 + 1 = 2, ejemplo base
    mov [result], al

    ; Convertir a ASCII
    movzx eax, byte [result]
    add eax, 63              ; 2 + 63 = 65 ('A' en ASCII)
    mov [buffer], al

    ; Imprimir 'Caracter: A'
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ; Imprimir el carácter '\'
    add eax, 27              ; Ajuste para imprimir '\'
    mov [buffer], al

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ; Imprimir el carácter '$'
    add eax, -8              ; Ajuste para imprimir '$'
    mov [buffer], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ; Imprimir el carácter '&'
    add eax, 2               ; Ajuste para imprimir '&'
    mov [buffer], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ; Imprimir el carácter '1'
    sub eax, 26              ; Ajuste para imprimir '1'
    mov [buffer], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ; Salida del programa
    mov eax, 1               ; Llamada al sistema para salir (sys_exit)
    xor ebx, ebx             ; Código de salida 0
    int 0x80                 ; Interrupción para salir
