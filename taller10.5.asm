section .data
    count db 10       ; Contador inicializado en 10

section .text
    global _start

_start:
    ; Bucle for con decremento
for_decrement_start:
    mov al, [count]       ; Cargamos el valor de count
    cmp al, 0             ; Compara count con 0
    jle for_decrement_end ; Si count <= 0, salimos del bucle

    ; Imprimimos el valor de count (aquí se puede usar algún método de salida)
    ; Este ejemplo solo muestra que se decrementa y lo imprime, usando salida estándar
    ; El código para imprimir podría ir aquí (similar a los ejemplos anteriores)

    ; Decrementamos count
    dec byte [count]      ; Decrementamos count por 1

    ; Repetimos el ciclo
    jmp for_decrement_start

for_decrement_end:
    ; Fin del bucle
    ; Aquí podrías terminar el programa o hacer cualquier otra cosa
    mov eax, 1            ; Código de salida (exit)
    int 0x80              ; Llamada al sistema para terminar el programa
