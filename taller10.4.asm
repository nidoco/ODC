section .data
    num db 7           ; Número a comprobar
    result_even db 'Par'   ; Mensaje para número par
    result_odd db 'Impar'  ; Mensaje para número impar

section .text
    global _start

_start:
    ; Cargamos num
    mov al, [num]          ; Cargamos el valor de num

    ; Comprobamos si el número es par
    test al, 1             ; Testea si el bit menos significativo es 0 (par) o 1 (impar)
    jz even                ; Si es 0 (par), saltamos a la etiqueta "even"

odd:
    ; Si el número es impar
    ; En este caso, almacenamos "Impar" en result_odd
    mov edx, result_odd    ; Cargamos la dirección de result_odd
    jmp print_result

even:
    ; Si el número es par
    ; En este caso, almacenamos "Par" en result_even
    mov edx, result_even   ; Cargamos la dirección de result_even

print_result:
    ; Imprimir el mensaje (para propósitos de demostración)
    ; Este código solo es ilustrativo, ya que para imprimir realmente se necesitaría llamar a una función del sistema operativo
    mov eax, 4             ; Llamada al sistema para escribir
    mov ebx, 1             ; Escribimos en la salida estándar (stdout)
    mov ecx, edx           ; Dirección del mensaje
    mov edx, 4             ; Longitud del mensaje (solo "Par" o "Impar")
    int 0x80               ; Llamado al sistema para imprimir

    ; Fin del programa
    mov eax, 1             ; Código de salida (exit)
    int 0x80               ; Llamado al sistema para terminar el programa
