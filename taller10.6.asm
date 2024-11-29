section .data
    num1 db 5             ; Primer número (se puede cambiar este valor)
    num2 db 3             ; Segundo número (se puede cambiar este valor)
    result db 0           ; Variable para almacenar el resultado de la suma
    msg db "Resultado: ", 0 ; Cadena inicial
    resultStr db "00", 10 ; Cadena para el resultado en ASCII y salto de línea
    zeroMsg db "Esto es un cero", 10 ; Mensaje "Esto es un cero" con salto de línea

section .text
    global _start

_start:
    ; Realizar la suma
    mov al, [num1]        ; Cargar num1 en al
    add al, [num2]        ; Sumar num2 a num1
    mov [result], al      ; Almacenar el resultado en 'result'

    ; Verificar si el resultado es cero
    cmp al, 0             ; Compara el resultado con 0
    je print_zero         ; Si es cero, saltamos a la etiqueta 'print_zero'

    ; Si el resultado no es cero, convertimos el resultado a ASCII y lo mostramos
    add al, '0'           ; Convertimos el resultado (en número) a carácter ASCII
    mov [resultStr], al   ; Guardamos el carácter en 'resultStr'

    ; Imprimir mensaje de texto "Resultado: "
    mov eax, 4            ; Syscall para escribir
    mov ebx, 1            ; Salida estándar (stdout)
    mov ecx, msg          ; Dirección del mensaje
    mov edx, 11           ; Longitud del mensaje
    int 0x80              ; Llamada al sistema

    ; Imprimir el resultado de la suma
    mov eax, 4            ; Syscall para escribir
    mov ebx, 1            ; Salida estándar (stdout)
    mov ecx, resultStr    ; Dirección de la cadena del resultado
    mov edx, 2            ; Longitud de la cadena (1 carácter y nueva línea)
    int 0x80              ; Llamada al sistema

    jmp end_program       ; Saltamos al final del programa

print_zero:
    ; Si el resultado es cero, imprimimos "Esto es un cero"
    mov eax, 4            ; Syscall para escribir
    mov ebx, 1            ; Salida estándar (stdout)
    mov ecx, zeroMsg      ; Dirección del mensaje "Esto es un cero"
    mov edx, 16           ; Longitud del mensaje "Esto es un cero"
    int 0x80              ; Llamada al sistema

end_program:
    ; Terminar el programa
    mov eax, 1            ; Syscall para salir
    xor ebx, ebx          ; Código de salida 0
    int 0x80              ; Llamada al sistema
