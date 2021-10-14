%include "io.inc"

section .data

    ; Estos son los parametros que se envian a la funcion inicialmente
    param_puntero dq 1.0,2.0,3.0,4.0
    param_r dq 4.0
    
    ; Variables que utiliza internamente la funcion
    funcion_puntero dd 0
    funcion_r dq 0
    temp dq 0.0
    indice dd 0
    contador db 0
    formato db "Numero: %f", 10, 13

section .text
    global CMAIN
    extern printf
    
CMAIN:

    ; Cargo el parametro R
    push dword[param_r+4]              ; Cargo en la pila la parte baja
    push dword[param_r]                ; Cargo en la pila la parte alta

    ; Cargo el parametro puntero
    push param_puntero                 ; Cargo en la pila la direccion al puntero

    jmp producto_escalar               ; Llamo a la funcion producto escalar
    
    ret

    producto_escalar:

        ; Obtengo la direccion al puntero de la lista
        pop dword[funcion_puntero]
    
        ; Obtengo el valor del parametro R
        pop dword[funcion_r]
        pop dword[funcion_r+4]
        
        ; enter
        push ebp
        mov ebp, esp

        ; Inicializo variables para el ciclo
        mov dword[indice], 0           ; Inicializo el indice
        mov byte[contador], 4          ; Inicializo el contador
        
                
        ; Ejecuto este ciclo una vez para cada elemento de la lista
        
        ciclo:
            mov esi, [indice]          ; Cargo mi indice/offset
    
            ; Utilizo el FPU para hacer la multiplicacion
            mov eax, [funcion_puntero] ; Cargo en eax la direccion al puntero
            finit
            fld qword[eax+esi*8]       ; Cargo el elemento actual al FPU
            fld qword[funcion_r]       ; Cargo la constante al FPU
            fmul                       ; Multiplico los dos valores anteriores
            fst qword[temp]            ; Guardo en variable temporal el resultado
            
            ; Muestro por consola el resultado de la multiplicacion
            push dword[temp+4]         ; Cargo en la pila la parte baja
            push dword[temp]           ; Cargo en la pila la parte alta
            push formato               ; Cargo en la pila el formato
            call printf                ; Llamo al printf de C
            add esp, 12                ; Sumo al ESP 4 bytes * los 3 elementos agregados a la pila
            
            ; Reviso las condiciones del ciclo    
            inc esi                    ; Sumo 1 al indice
            mov [indice], esi          ; Guardo el indice
            
            mov al, [contador]         ; Cargo el contador de iteraccion
            dec al                     ; Resto 1 al contador
            mov [contador], al         ; Guardo el contador
            
            cmp al, 0                  ; Comparo el contador con 0
            jg ciclo                   ; Si el contador es mayor a cero vuelvo a entrar al ciclo

        ; leave
        mov ebp, esp
        pop ebp
        
        ret