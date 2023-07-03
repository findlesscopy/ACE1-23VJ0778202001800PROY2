# **Proyecto 2**
### Universidad de San Carlos de Guatemala
### Facultad de Ingeniería
### Escuela de Ciencias y Sistemas
### Arquitectura de Computadores y Ensambladores 1
### Sección N
<br></br>

## **Manual Técnico**
<br></br>

| Nombre | Carnet | 
| --- | --- |
| José Manuel Ibarra Pirir | 202001800 |
----

# **Descripción General**

El proyecto consiste en una réplica del juego Sokoban. Este juego contará con un menu principal para poder movilizarse con las difernete funciones.

# **Requerimientos**
- DOSBox
- MASM

# **Descripcion Tecnica**

## **Funcionalidades principales**
1. La primera opcion disponible es la de iniciar el juego, la cual nos llevara a la pantalla de juego del primer nivel, luego al superar el nivel se pasara al siguiente nivel hasta que se acaben los niveles.
```
cargar_nivel_secuencial: 
		;call memset
		mov AL, 00
		mov DX, offset nivel_0
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		jmp ciclo_lineas

		mov AL, 00
		mov DX, offset nivel_1
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		jmp ciclo_lineas

		mov AL, 00
		mov DX, offset nivel_2
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		jmp ciclo_lineas
		;;
```
2. La segunda opcion es la de cargar nivel, donde se le solicitará al usuario el nombre del archivo que desea cargar, si el archivo existe se cargará el nivel, de lo contrario se mostrará un mensaje de error.
```
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
```
3. ultima opcion es la de salir, la cual nos sacara del programa.

## **Funciones secundarias**
1. Carga de niveles: se procede a leer el archivo linea por linea:
```
ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je ver_si_hay_algo_en_linea
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		jmp logica_parseo
```
2. Parseo de niveles: se procede a leer el archivo caracter por caracter:
```
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
```
3. Movimiento del jugador: se leen las entradas del usuario para traducirlas en movimientos dentro del juego e interactuar con los elementos del nivel:
```
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
```