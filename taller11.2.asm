section .data
    direccion:
        calle db "Avenida Siempre Viva", 0 ;calle con terminador null
        numero db "742", 0                 ; numero de la casa
        colonia db "Springfield", 0        ; nombre de la colonia
        ciudad db "Springfield", 0         ; ciudad
        codigo_postal db "12345", 0        ; codigo postal
section .text
    lea si, [direccion]                    ; cargar la calle
    lea di, [direccion+24]                 ; cargar numero de la casa
    lea si, [direccion+30]                 ; cargar colonia
    mov byte [direccion+42], 'S'
    mov byte [direccion+42], 'h'
    mov byte [direccion+42], 'e'
    mov byte [direccion+42], 'l'
    mov byte [direccion+42], 'b'
    mov byte [direccion+42], 'y'
    mov byte [direccion+42], 'v'
    mov byte [direccion+42], 'i'
    mov byte [direccion+42], 'l'
    mov byte [direccion+42], 'l'
    mov byte [direccion+42], 'e'
    mov byte [direccion+42], 0          ; null-terminador
    