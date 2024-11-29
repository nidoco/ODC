section .data
    product db 1         ; Almacenará el resultado de la multiplicación
    i db 1               ; Inicializamos i en 1

section .text
    global _start

_start:
    ; Inicializamos product a 1 y i a 1 (ya hecho)

for_start:
    ; Comparamos i con 6
    mov al, [i]          ; Cargamos el valor de i
    cmp al, 6            ; Compara i con 6
    jg for_end           ; Si i > 6, salimos del bucle

    ; Multiplicamos product por i
    mov al, [product]    ; Cargamos el valor de product
    mov bl, [i]          ; Cargamos el valor de i
    mul bl               ; Multiplicamos al * bl
    mov [product], al    ; Guardamos el resultado en product

    ; Incrementamos i
    inc byte [i]         ; Incrementamos i por 1

    ; Repetimos el ciclo
    jmp for_start        ; Repetir el ciclo

for_end:
    ; Fin del bucle
    ; Aquí podrías imprimir el resultado o continuar con el programa
    mov eax, 1           ; Código de salida (exit)
    int 0x80             ; Llamada al sistema para terminar el programa
