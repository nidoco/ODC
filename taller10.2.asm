section .data
    nums db 1, 2, 3, 4, 5, 6, -1 ; Lista de números (termina en -1)
    sum db 0                     ; Variable donde se almacenará la suma
    ptr db nums                  ; Puntero a la lista de números

section .text
    global _start

_start:
    ; Inicializamos sum a 0
    mov byte [sum], 0

do_while_start:
    ; Leemos el valor actual de la lista
    mov al, [ptr]                ; Cargamos el valor actual de nums en al
    test al, al                  ; Comprobamos si es negativo (al == -1)
    js do_while_end              ; Si es negativo, salimos del bucle

    ; Sumamos el valor al total
    add [sum], al

    ; Avanzamos al siguiente número de la lista
    inc byte [ptr]               ; Mover el puntero al siguiente número
    jmp do_while_start           ; Repetir el ciclo

do_while_end:
    ; Fin del bucle
    ; Aquí podrías imprimir el resultado o continuar con el programa
    mov eax, 1                   ; Código de salida (exit)
    int 0x80                     ; Llamada al sistema para terminar el programa
