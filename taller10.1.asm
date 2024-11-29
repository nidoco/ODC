section .data
    sum db 0             ; Variable donde se almacena la suma
    count db 1           ; Contador inicializado en 1
    msg db "La suma es: " ; Mensaje a imprimir
    len equ $ - msg

section .bss
    result resb 10       ; Buffer para almacenar el resultado

section .text
    global _start

_start:
    ; Inicializamos sum a 0 y count a 1 (ya hecho)

while_start:
    mov al, [count]       ; Cargamos el valor de count
    cmp al, 10            ; Comparamos count con 10
    jg while_end          ; Si count > 10, saltamos del bucle

    ; Sumamos count al valor de sum
    mov al, [sum]         ; Cargamos el valor de sum
    add al, [count]       ; Sumamos el valor de count
    mov [sum], al         ; Almacenamos la suma en sum

    ; Incrementamos count
    inc byte [count]      ; Incrementamos count por 1

    jmp while_start       ; Repetimos el ciclo
                          ; Saltamos de nuevo a la comprobación de la condición

while_end:
    ; Imprimir el resultado de la suma
    ; Convertir el valor de 'sum' a cadena de texto
    mov al, [sum]         ; Cargamos el valor de sum
    add al, 48            ; Convertimos el número en carácter ASCII
    mov [result], al      ; Almacenamos el carácter en result

    ; Mostrar el mensaje
    mov eax, 4            ; sys_write
    mov ebx, 1            ; Descriptor de archivo (stdout)
    mov ecx, msg          ; Dirección del mensaje
    mov edx, len          ; Longitud del mensaje
    int 80h               ; Llamada al sistema

    ; Mostrar el resultado
    mov eax, 4            ; sys_write
    mov ebx, 1            ; Descriptor de archivo (stdout)
    mov ecx, result       ; Dirección del resultado
    mov edx, 1            ; Longitud del resultado (1 carácter)
    int 80h               ; Llamada al sistema

    ; Terminar el programa
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; Código de salida 0
    int 80h               ; Llamada al sistema
