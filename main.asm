NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug    db   08, 08
data_sprite_jug   db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 70, 70, 28, 28, 28, 28, 8f
                  db   8f, 70, 70, 28, 00, 28, 00, 8f
                  db   8f, 70, 70, 28, 00, 28, 00, 8f
                  db   8f, 70, 70, 28, 28, 28, 28, 8f
                  db   8f, 70, 70, 28, 28, 28, 28, 8f
                  db   8f, 70, 70, 70, 70, 70, 70, 8f
                  db   8f, 70, 70, 70, 70, 70, 70, 8f
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   44, 44, 44, 44, 44, 44, 00, 00
                    db   44, 44, 44, 44, 44, 44, 00, 00
                    db   44, 44, 44, 44, 44, 44, 00, 00
                    db   44, 44, 44, 44, 44, 44, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
                  db   8f, 8f, 8f, 8f, 8f, 8f, 8f, 8f
dim_sprite_pared  db   08, 08
data_sprite_pared db   78, 78, 78, 78, 78, 78, 78, 78
                  db   78, 76, 76, 78, 78, 76, 76, 78
                  db   78, 78, 76, 78, 78, 76, 76, 78
                  db   78, 76, 76, 78, 78, 76, 76, 78
                  db   78, 76, 76, 78, 78, 76, 76, 78
                  db   78, 78, 76, 78, 78, 76, 76, 78
                  db   78, 76, 76, 78, 78, 76, 76, 78
                  db   78, 78, 78, 78, 78, 78, 78, 78
dim_sprite_caja   db   08, 08
data_sprite_caja  db  8f,8f,8f,8f,8f,8f,8f,8f
                  db  8f,8f,0b8,0b8,0b8,0b8,8f,8f
                  db  8f,0b8,8a,8a,8a,8a,0b8,8f
                  db  8f,0b8,8a,8a,8a,8a,0b8,8f
                  db  8f,0b8,8a,8a,8a,8a,0b8,8f
                  db  8f,0b8,8a,8a,8a,8a,0b8,8f
                  db  8f,8f,0b8,0b8,0b8,0b8,8f,8f
                  db  8f,8f,8f,8f,8f,8f,8f,8f
dim_sprite_obj    db   08, 08
data_sprite_obj   db  8f,8f,8f,8f,8f,8f,8f,8f
                  db  8f,02,02,02,02,02,02,8f
                  db  8f,8f,8f,8f,8f,8f,02,8f
                  db  8f,02,02,02,02,8f,02,8f
                  db  8f,02,8f,8f,02,8f,02,8f
                  db  8f,02,8f,8f,8f,8f,02,8f
                  db  8f,02,02,02,02,02,02,8f
                  db  8f,8f,8f,8f,8f,8f,8f,8f
mapa              db   3e8 dup (0)
iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "JMIP - 202001800$"

usac          db " UNIVERSIDAD DE SAN CARLOS DE GUATEMALA",0a,"$"
facultad      db " FACULTAD DE INGENIERIA",0a,"$"
escuela       db " ESCUELA DE CIENCIAS Y SISTEMAS",0a,"$"
curso         db " ARQ. COMPUTADORES Y ENSAMBLADORES 1",0a,"$"
nombre        db " JOSE MANUEL IBARRA PIRIR",0a,"$"
carnet        db " 202001800",0a,"$"
mensaje_enter db " PRESIONE ENTER PARA CONTINUAR",0a,"$"
nueva_lin     db 0a,"$"
pedir_nivel   db " INGRESE EL NIVEL A CARGAR: ",0a,"$"
err_archivo      db " NO EXISTE EL ARCHIVO",0a,"$"
err_jugador 	db " NO SE ENCONTRO EL JUGADOR",0a,"$"
err_cajas_objetivos 	db "EL NUMERO DE CAJAS Y OBJETIVOS NO COINCIDEN",0a,"$"

controles_actuales 	db " CONTROLES ACTUALES",0a,"$"
control_arriba_configuracion 	db " ARRIBA: FLECHA ARRIBA",0a,"$"
control_abajo_configuracion 	db " ABAJO: FLECHA ABAJO",0a,"$"
control_izquierda_configuracion 	db " IZQUIERDA: FLECHA IZQUIERDA",0a,"$"
control_derecha_configuracion 	db " DERECHA: FLECHA DERECHA",0a,"$"

cambiar_controles 	db " CAMBIAR CONTROLES",0a,"$"
regresar 	db " REGRESAR",0a,"$"

reanudar_juego db "REANUDAR JUEGO$"
salir_juego	db "SALIR$"
;; JUEGO
xJugador      db 0
yJugador      db 0
puntos        dw 0
;; MENÚS
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0
;; CONTROLES
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d
control_pausa     db  3c
;; CONTADORES
contador_jugador   dw 0
contador_objetivos dw 0
contador_cajas     dw 0
;; NIVELES 
nivel_x           db  "NIV.01",00
nivel_0           db  "NIV.00",00
nivel_1           db  "NIV.01",00
nivel_2           db  "NIV.02",00
nivel_nombre      db  10 dup (0)
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
bool_objeto 	  db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
numero        db  5 dup (30)
;;
buffer_entrada db  20,00
			   db  20 dup (0)


.CODE
.STARTUP
muestra_pantalla_inicio:
		;; MODO VIDEO ;;
		mov AH, 00
		mov AL, 13
		int 10

        call pantalla_inicio
inicio:
		;;;;;;;;;;;;;;;;
		call menu_principal
		mov AL, [opcion]
		;; > INICIAR JUEGO
		cmp AL, 0
		je cargar_nivel_secuencial
		;; > CARGAR NIVEL
		cmp AL, 1
		je cargar_un_nivel
		;; > CONFIGURACION
		cmp AL, 3
		je menu_configuracion
		;; > PUNTAJES ALTOS
		;; > SALIR
		cmp AL, 4
		je fin
		;;;;;;;;;;;;;;;;


ciclo_juego:

		call pintar_mapa
		call entrada_juego
		;call memset
		jmp ciclo_juego
		;;;;;;;;;;;;;;;;

cargar_nivel_secuencial: 
		;call memset
		mov AL, 00
		mov DX, offset nivel_0
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		mov DI, offset mapa
		mov CX,  3e8
		mov AL,  00
		call memset
		jmp ciclo_lineas

		;;

cargar_un_nivel:

		call clear_pantalla
		
		mov DL, 01
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10

		mov DX, offset pedir_nivel
		mov AH, 09h
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0ah
		int 21

		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  no_existe_archivo
		cmp AL, 8  ;; tamaño máximo del campo
		jb  aceptar_tam_nivel ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp cargar_un_nivel

aceptar_tam_nivel:
		mov SI, offset nivel_nombre
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI
copiar_nombre_nivel:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre_nivel

		mov DX, offset nueva_lin
		mov AH, 09
		int 21
buscar_archivo:
		mov AL, 02
		mov AH, 3d
		mov DX, offset nivel_nombre
		int 21
		jc no_existe_archivo

		mov CX, 26
		mov DX, offset nivel_nombre
		mov AH, 40
		int 21

cargar_un_nivel_x:
		mov AL, 00	
		mov DX, offset nivel_nombre
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		mov DI, offset mapa
		mov CX,  3e8
		mov AL,  00
		call memset
		jmp ciclo_lineas
		;;
no_existe_archivo:

		;call clear_pantalla

		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset err_archivo
		mov AH, 09
		int 21

		call press_enter
		jmp cargar_un_nivel

ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je ver_si_hay_algo_en_linea
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		jmp logica_parseo
ver_si_hay_algo_en_linea:
		cmp DH, 00
		je fin_parseo
		;;;;;;;;;;;;;;;;;;;;;;;
		;; lógica del parseo ;;
		;;;;;;;;;;;;;;;;;;;;;;;
		;; ignorar espacios o retornos de carro
logica_parseo:
		mov DI, offset linea
		push DI
		;; veríficar retorno de carro
		mov AL, [DI]
		cmp AL, 20
		je ignorar0
		cmp AL, 0d
		je ignorar0
		jmp iniciar_parseo
ignorar0:
		call ignorar_espacios
		;;
		;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
iniciar_parseo:
		;; Inicializacion de contadores
		mov SI, 00
		mov BX, 00
		mov CX, 00

		;;
		mov SI, offset tk_pared
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_pared
		pop DI
		push DI
		mov SI, offset tk_caja
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_caja
		pop DI
		push DI
		mov SI, offset tk_suelo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_suelo
		pop DI
		push DI
		mov SI, offset tk_objetivo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_objetivo
		pop DI
		push DI
		mov SI, offset tk_jugador
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_jugador
		pop DI
		jmp ciclo_lineas
es_pared:
		mov AL, PARED
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_caja:
		mov AL, CAJA
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_suelo:
		mov AL, SUELO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_objetivo:
		add CX, 1
		mov contador_objetivos, CX
		mov AL, OBJETIVO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_jugador:
		add BX, 1
		mov contador_jugador, BX
		mov AL, JUGADOR
		mov [elemento_actual], AL
		jmp continuar_parseo0
		;; ignorar espacios
continuar_parseo0:
		pop SI         ; ignorara valor inicial de DI
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [xElemento], AL
		pop DI
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		je continuar_parseo1
		cmp AL, ','
		je continuar_parseo2
		jmp ciclo_lineas
continuar_parseo1:
		;; ignorar espacios
		call ignorar_espacios
continuar_parseo2:
		;; obtener una coma
		mov SI, offset tk_coma
		call cadena_igual
		cmp DL, 0ff
		jne ciclo_lineas
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		mov AL, [elemento_actual]
		cmp AL, JUGADOR
		jne seguir_normal_debug
seguir_normal_debug:
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [yElemento], AL
		pop DI
		;; ignorar_espacios o retorno de carro
		mov AL, [DI]
		cmp AL, 20
		je ignorar1
		cmp AL, 0d
		je ignorar1
		jmp ver_final_de_linea
ignorar1:
		call ignorar_espacios
		;; ver si es el final de la cadena
ver_final_de_linea:
		mov AL, [DI]
		cmp AL, 00
		jne ciclo_lineas
		;; usar la información
		;;
		mov DL, [elemento_actual]
		mov AH, [xElemento]
		mov AL, [yElemento]
		call colocar_en_mapa
		mov AL, JUGADOR
		cmp AL, [elemento_actual]
		je guardar_coordenadas_jugador
		jmp ciclo_lineas
guardar_coordenadas_jugador:
		mov AH, [xElemento]
		mov AL, [yElemento]
		mov [xJugador], AH
		mov [yJugador], AL
		jmp ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
		

		cmp contador_jugador, 0
		je error_no_hay_jugador
		;; cerrar archivo
		cmp contador_objetivos, 0
		je error_cajas_objetivos

		mov AH, 3e
		mov BX, [handle_nivel]
		int 21
		;;
		mov contador_jugador, 0
		mov contador_objetivos, 0
		jmp ciclo_juego
		jmp fin

error_no_hay_jugador:
		call clear_pantalla

		mov DX, offset nueva_lin
		mov AH, 09
		int 21

		mov DX, offset err_jugador
		mov AH, 09h
		int 21
		call press_enter


		jmp inicio

error_cajas_objetivos:
		call clear_pantalla

		mov DX, offset nueva_lin
		mov AH, 09
		int 21

		mov DX, offset err_cajas_objetivos
		mov AH, 09h
		int 21
		call press_enter


		jmp inicio
;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 0200
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret
		

;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;; mensaje_inicio - muestra el mensaje inicial
pantalla_inicio:
        call clear_pantalla

        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        mov DX, offset usac
		mov AH, 09
		int 21
        mov DX, offset facultad
		mov AH, 09
		int 21
        mov DX, offset escuela
		mov AH, 09
		int 21
        mov DX, offset curso
		mov AH, 09
		int 21
        mov DX, offset nombre
		mov AH, 09
		int 21
        mov DX, offset carnet
		mov AH, 09
		int 21
        mov DX, offset nueva_lin
        mov AH, 09
        int 21
        mov DX, offset nueva_lin
        mov AH, 09
        int 21

        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay

        ret




;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 5
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset cargar_nivel
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; PUNTAJES ALTOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset configuracion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 00   ;; fila
		;;
ciclo_v:
		cmp AL, 19
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
        cmp DL, NADA
		je pintar_vacio_mapa
		;;
        cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
        cmp DL, PARED
		je pintar_pared_mapa
		;;
        cmp DL, CAJA
		je pintar_caja_mapa
		;;
        cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
        cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		ret

;; menu_configuracion - menu de configuracion
menu_configuracion:

		call menu_configuracion_si
		mov AL, [opcion]

		cmp AL, 0
		je cambiar_controles_menu
		cmp AL, 1
		je inicio

		jmp menu_configuracion

cambiar_controles_menu:
			mov DX, offset escuela
		mov AH, 09
		int 21
		ret

menu_configuracion_si:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; CAMBIAR CONTROLES
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10

		push DX
		mov DX, offset cambiar_controles
		mov AH, 09
		int 21
		pop DX
		;;;; REGRESAR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10

		push DX
		mov DX, offset regresar
		mov AH, 09
		int 21
		pop DX

		;; IMPRIMIR FLECHA ;;
		call pintar_flecha

entrada_menu_configuracion:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_configuracion
		cmp AH, 50
		je sumar_opcion_menu_configuracion
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_configuracion
restar_opcion_menu_configuracion:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_configuracion
		mov [opcion], AL
		jmp mover_flecha_menu_configuracion
sumar_opcion_menu_configuracion:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo_configuracion
		mov [opcion], AL
		jmp mover_flecha_menu_configuracion
volver_a_cero_configuracion:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_configuracion
volver_a_maximo_configuracion:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_configuracion
mover_flecha_menu_configuracion:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_configuracion:
		cmp CL, 0
		je pintar_flecha_menu_configuracion
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_configuracion
pintar_flecha_menu_configuracion:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_configuracion
		;;
fin_menu_configuracion:
		ret
;; menu_pausa - menu de pausa
menu_pausa: 
		call menu_pausa_si
		mov AL, [opcion]

		cmp AL, 0
		je regresar_juego
		cmp AL, 1
		je inicio

		jmp menu_pausa
regresar_juego:
		ret
menu_pausa_si:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset reanudar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir_juego
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
entrada_menu_pausa:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_pausa
		cmp AH, 50
		je sumar_opcion_menu_pausa
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_pausa
restar_opcion_menu_pausa:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_pausa
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
sumar_opcion_menu_pausa:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo_pausa
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
volver_a_cero_pausa:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
volver_a_maximo_pausa:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
mover_flecha_menu_pausa:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_pausa:
		cmp CL, 0
		je pintar_flecha_menu_pausa
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_pausa
pintar_flecha_menu_pausa:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_pausa
		;;
fin_menu_pausa:
		ret

;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, [control_arriba]
		je mover_jugador_arr
		cmp AH, [control_abajo]
		je mover_jugador_aba
		cmp AH, [control_izquierda]
		je mover_jugador_izq
		cmp AH, [control_derecha]
		je mover_jugador_der
		cmp AH, [control_pausa]
		je menu_pausa
		ret
mover_jugador_arr:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AL
		push AX
		call obtener_de_mapa 
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_arriba
		;;
		cmp DL, CAJA
		je hay_caja_arriba

		cmp DL, OBJETIVO
		je hay_objetivo_arriba
		;;
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp bool_objeto, 1
		je mover_dejando_objetivo_arriba

		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		ret

mover_dejando_objetivo_arriba:
		mov DL, OBJETIVO
		inc AL
		call colocar_en_mapa
		mov bool_objeto, 0
		ret
hay_objetivo_arriba:
		dec AL
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_arriba

		mov DL, JUGADOR
		inc AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AL
		call colocar_en_mapa

		mov bool_objeto, 1

		ret

hay_pared_arriba:
		ret
hay_caja_arriba:
		dec AL
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_arriba

		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		ret
mover_jugador_aba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_abajo

		cmp DL, CAJA
		je hay_caja_abajo

		cmp DL, OBJETIVO
		je hay_objetivo_abajo

		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp bool_objeto, 1
		je mover_dejando_objetivo_abajo

		mov DL, SUELO
		dec AL
		call colocar_en_mapa

		ret
mover_dejando_objetivo_abajo:
		mov DL, OBJETIVO
		dec AL
		call colocar_en_mapa
		mov bool_objeto, 0
		ret


hay_pared_abajo:
		ret
hay_objetivo_abajo:
		inc AL
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_abajo

		mov DL, JUGADOR
		dec AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AL
		call colocar_en_mapa

		mov bool_objeto, 1
		
		ret
hay_caja_abajo:
		inc AL
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_abajo
		
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		dec AL
		mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		ret
mover_jugador_izq:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_izquierda

		cmp DL, CAJA
		je hay_caja_izq

		cmp DL, OBJETIVO
		je hay_objetivo_izq

		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp bool_objeto, 1
		je mover_dejando_objetivo_izq

		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		ret
mover_dejando_objetivo_izq:
		mov DL, OBJETIVO
		inc AH
		call colocar_en_mapa
		mov bool_objeto, 0
		ret
hay_objetivo_izq:
		dec AH
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_izquierda

		mov DL, JUGADOR
		inc AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AH
		call colocar_en_mapa

		mov bool_objeto, 1

		ret
hay_pared_izquierda:
		ret
hay_caja_izq:
		dec AH
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_izquierda

		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		inc AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		ret

mover_jugador_der:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_derecha

		cmp DL, CAJA
		je hay_caja_der

		cmp DL, OBJETIVO
		je hay_objetivo_der

		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp bool_objeto, 1
		je mover_dejando_objetivo_der

		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		ret
mover_dejando_objetivo_der:
		mov DL, OBJETIVO
		dec AH
		call colocar_en_mapa
		mov bool_objeto, 0
		ret
hay_objetivo_der:
		inc AH
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_derecha

		mov DL, JUGADOR
		dec AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AH
		call colocar_en_mapa

		mov bool_objeto, 1

		ret
hay_pared_derecha:
		ret
hay_caja_der:
		inc AH
		push AX
		call obtener_de_mapa
		pop AX

		cmp DL, PARED
		je hay_pared_derecha

		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, JUGADOR
		dec AH
		mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX

		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		ret
fin_entrada_juego:
		ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
		mov AH, 3f
		mov CX, 0001
		mov DX, DI
		int 21h
		cmp AX, 0000
		je fin_siguiente_linea
		mov AL, [DI]
		cmp AL, 0a
		je quitar_nl_y_fin
		inc SI
		inc DI
		jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		int 03
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		je ignorar_caracter
		cmp AL, 0d
		je ignorar_caracter
		jmp fin_ignorar
ignorar_caracter:
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;; Press enter
press_enter:
    mov AH, 08                         ; Leer un caracter
    int 21h
    cmp AL, 0d
    jne press_enter
    ret


fin:
.EXIT
END
