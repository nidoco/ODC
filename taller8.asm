section .data
    msg db 'Resultado: ', 0   ; Mensaje inicial a imprimir
    newline db 0xA            ; Salto de línea

section .bss
    res resb 4                ; Reserva de 4 bytes para almacenar el resultado

section .text
    global _start

_start:
    ; Generar 'l' (ele minúscula)
    mov eax, 'l'              ; Cargar ASCII de 'l' en EAX
    mov [res], eax            ; Guardar el resultado en res

    ; Imprimir 'l'
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Generar 'D'
    mov eax, 'D'              ; Cargar ASCII de 'D'
    mov [res], eax

    ; Imprimir 'D'
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Generar 'B'
    mov eax, 'B'              ; Cargar ASCII de 'B'
    mov [res], eax

    ; Imprimir 'B'
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Generar '4'
    mov eax, 4                ; Cargar valor 4
    add eax, '0'              ; Convertir a carácter ASCII
    mov [res], eax

    ; Imprimir '4'
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Generar '2'
    mov eax, 2                ; Cargar valor 2
    add eax, '0'              ; Convertir a carácter ASCII
    mov [res], eax

    ; Imprimir '2'
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Imprimir nueva línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Terminar el programa
    mov eax, 1                ; Llamada al sistema para salir
    xor ebx, ebx              ; Código de salida 0
    int 0x80
