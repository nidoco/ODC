section .data
    curp db "ABCD901225HDFRRL01", 0 ; curp como cadena fija de 18 caracteres
section .text
    lea si, [curp]                  ; apuntar al inicio de la curp
    mov cx, 18                      ; longitud esperada
    mov byte [curp+16], '0'
    mov byte [curp+17], '2'