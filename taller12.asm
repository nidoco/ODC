section .data
    prompt db "Ingrese un número (0-9): ", 0  ; Mensaje para solicitar un número
    prompt_len equ $ - prompt               ; Longitud del mensaje
    result_msg db "El doble del número es: ", 0  ; Mensaje para mostrar el resultado
    result_msg_len equ $ - result_msg
    error_msg db "Entrada inválida. Debe ser un número entre 0 y 9.", 0
    error_msg_len equ $ - error_msg
    input db 0                             ; Variable para almacenar el carácter ingresado
    output db 0, 0, 0, 0                   ; Buffer para la salida del resultado

section .text
    global _start                          ; Punto de entrada del programa

_start:
    ; Mostrar el mensaje de entrada
    mov eax, 4                             ; syscall: write
    mov ebx, 1                             ; descriptor: salida estándar (stdout)
    mov ecx, prompt                        ; dirección del mensaje a mostrar
    mov edx, prompt_len                    ; longitud del mensaje
    int 0x80                               ; llamada al sistema

    ; Leer un carácter ingresado
    mov eax, 3                             ; syscall: read
    mov ebx, 0                             ; descriptor: entrada estándar (stdin)
    mov ecx, input                         ; dirección del buffer donde se guardará la entrada
    mov edx, 1                             ; longitud máxima de la entrada (1 carácter)
    int 0x80                               ; llamada al sistema

    ; Validar si el carácter es un número entre '0' y '9'
    mov dl, [input]                        ; Cargar el carácter ingresado en AL
    cmp al, '0'                            ; Comparar con '0'
    jl invalid_input                       ; Si es menor que '0', es inválido
    cmp al, '9'                            ; Comparar con '9'
    jg invalid_input                       ; Si es mayor que '9', es inválido

    ; Multiplicar el carácter por 2
    sub dl, '0'                            ; Convertir de ASCII a valor numérico
    shl dl, 1                              ; Multiplicar por 2
    cmp dl, 10                             ; Verificar si el resultado es mayor o igual a 10
    jl single_digit                        ; Si es menor que 10, es un solo dígito

    ; Manejar el caso de dos dígitos (resultado >= 10)
    add dl, '0'                            ; Convertir el cociente a ASCII
    sub dl, 10                             ; Dividir AX entre 10, cociente en AL, residuo en AH
    mov [output], dl                       ; Guardar el primer dígito en el buffer
    add dl, '0'                            ; Convertir el residuo a ASCII
    mov [output + 1], dl                   ; Guardar el segundo dígito en el buffer
    jmp display_result                     ; Saltar a mostrar el resultado

single_digit:
    add dl, '0'                            ; Convertir el resultado a ASCII
    mov [output], dl                       ; Guardar el resultado en el buffer
    mov byte [output + 1], 0               ; Agregar terminador nulo

display_result:
    ; Mostrar el mensaje de salida
    mov eax, 4                             ; syscall: write
    mov ebx, 1                             ; descriptor: salida estándar (stdout)
    mov ecx, result_msg                    ; Dirección del mensaje a mostrar
    mov edx, result_msg_len                ; Longitud del mensaje
    int 0x80
    ; Mostrar el resultado
    mov eax, 4                             ; syscall: write
    mov ebx, 1                             ; descriptor: salida estándar (stdout)
    lea ecx, [output]                      ; Dirección del resultado
    mov edx, 2                             ; Longitud máxima de 2 caracteres
    int 0x80                               ; llamada al sistema

    ; Terminar el programa
    mov eax, 1                             ; syscall: exit
    xor ebx, ebx                           ; Código de salida 0
    int 0x80                               ; llamada al sistema

invalid_input:
    ; Mostrar el mensaje de error
    mov eax, 4                             ; syscall: write
    mov ebx, 1                             ; descriptor: salida estándar (stdout)
    mov ecx, error_msg                     ; Dirección del mensaje de error
    mov edx, error_msg_len                 ; Longitud del mensaje de error
    int 0x80                               ; llamada al sistema

    ; Terminar el programa con error
    mov eax, 1                             ; syscall: exit
    mov ebx, 1                             ; Código de salida 1
    int 0x80     