section ,data
    correo:
        usuario db "usuario", 0     ; Usuario com cadena null-terminated
        dominio db "dominio.com", 0 ; Dominio como cadena null-terminated
section .text  
    lea si, [correo]    ; Cargar direccion del usuario
    lea di, [correo+8]  ; Cargar direccion del dominio
    mov byte [correo+8], 'n'
    mov byte [correo+9], 'u'
    mov byte [correo+10], 'e'
    mov byte [correo+11], 'v'
    mov byte [correo+12], 'o'
    mov byte [correo+13], '.'
    mov byte [correo+14], 'c'
    mov byte [correo+15], 'o'
    mov byte [correo+16], 'm'
    mov byte [correo+17], 0     ; Null-terminador