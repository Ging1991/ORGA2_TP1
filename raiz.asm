extern printf

section .data
    
    ; Parametros
    par_a DQ  1.0
    par_b DQ  3.5
    par_c DQ -2.0
    
    ; Variables temporales
    temp_menosb DQ 0.0
    temp_2a DQ 0.0
    temp_menos4ac DQ 0.0
    temp_bcuadrado DQ 0.0
    temp_radicando DQ 0.0
    temp_raiz_cuadrada DQ 0.0
    temp_raiz1_pos DQ 0.0
    temp_raiz2_neg DQ 0.0
    
    ; Otras
    formato DB "Resultado: %f",10,0
    constante1 DQ -1.0
    constante2 DQ  2.0
    constante3 DQ -4.0

section .text
    global calcular

calcular:

    ; enter
    push ebp
    mov ebp, esp
    
    ; Obtengo -B
    finit
    fld qword[par_b]      ; Apilo B
    fld qword[constante1] ; Apilo constante con valor -1
    fmul                  ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fst qword[temp_menosb]; Guardo ST0 en variable temporal
    
    ; Obtengo 2A
    finit
    fld qword[par_a]      ; Apilo A
    fld qword[constante2] ; Apilo constante con valor 2
    fmul                  ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fst qword[temp_2a]    ; Guardo ST0 en variable temporal

    ; Obtengo B cuadrado
    finit
    fld qword[par_b]      ; Apilo B
    fld qword[par_b]      ; Apilo B (de nuevo)
    fmul                  ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fst qword[temp_bcuadrado]; Guardo ST0 en variable temporal

    ; Obtengo -4AC
    finit
    fld qword[par_a]          ; Apilo A
    fld qword[par_c]          ; Apilo C
    fmul                      ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fld qword[constante3]     ; Apilo constante con valor -4
    fmul                      ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fst qword[temp_menos4ac]  ; Guardo ST0 en variable temporal

    ; Obtengo el radicando B**2 -4AC
    finit
    fld qword[temp_bcuadrado] ; Apilo B**2
    fld qword[temp_menos4ac]  ; Apilo -4AC
    fadd                      ; Sumo ST0 y ST1, el resultado se guarda en ST0
    fst qword[temp_radicando] ; Guardo ST0 en variable temporal

    ; Obtengo raiz cuadrada
    finit
    fld qword[temp_radicando]     ; Apilo el radicando
    fsqrt                         ; Calculo la raiz cuadrada de ST0, el resultado se guarda en ST0
    fst qword[temp_raiz_cuadrada] ; Guardo ST0 en variable temporal

    ; Obtengo la primer raiz
    finit
    fld qword[temp_raiz_cuadrada] ; Apilo la raiz cuadrada
    fld qword[temp_menosb]        ; Apilo -B
    fadd                          ; Sumo ST0 y ST1, considero el signo positivo para la raiz
    fld qword[temp_2a]            ; Apilo 2A
    fdiv                          ; Divido ST1 por ST0, el resultado se guarda en ST0
    fst qword[temp_raiz1_pos]     ; Guardo ST0 en variable temporal

    ; Obtengo la segunda raiz
    finit
    fld qword[temp_raiz_cuadrada] ; Apilo la raiz cuadrada
    fld qword[constante1]         ; Apilo constante con valor -1
    fmul                          ; Multiplico ST0 por ST1, el resultado se guarda en ST0
    fld qword[temp_menosb]        ; Apilo -B
    fadd                          ; Sumo ST0 y ST1, considero el signo negativo para la raiz
    fld qword[temp_2a]            ; Apilo 2A
    fdiv                          ; Divido ST1 por ST0, el resultado se guarda en ST0
    fst qword[temp_raiz2_neg]     ; Guardo ST0 en variable temporal

    
    ; Muestro por pantalla la raiz 1
    push dword[temp_raiz1_pos+4] ; Envio la parte baja a la pila
    push dword[temp_raiz1_pos]   ; Envio la parte alta a la pila
    push formato                 ; Envio el formato a la pila
    call printf                  ; Llamo a la funcion printf de C
    add esp, 12                  ; Sumo 12 porque son 3 elementos de pila * 4 bytes

    ; Muestro por pantalla la raiz 2
    push dword[temp_raiz2_neg+4] ; Envio la parte baja a la pila
    push dword[temp_raiz2_neg]   ; Envio la parte alta a la pila
    push formato                 ; Envio el formato a la pila
    call printf                  ; Llamo a la funcion print de C
    add esp, 12                  ; Sumo 12 porque son 3 elementos de pila * 4 bytes
    
    ; leave
    mov ebp, esp
    pop ebp

    ret