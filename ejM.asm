.MODEL SMALL
.RADIX 16
.STACK
.DATA
contador_a    dw  0000
valor    db   00
hola     db   "Hola",0a,"$"
dim_sprite_jug    db   08, 08
data_sprite_jug   db   00, 00, 00, 03, 03, 00, 00, 00
                  db   00, 00, 00, 03, 03, 00, 00, 00
                  db   00, 00, 03, 03, 03, 03, 00, 00
                  db   00, 03, 00, 03, 03, 00, 03, 00
                  db   00, 00, 00, 03, 03, 00, 00, 00
                  db   00, 00, 00, 03, 03, 00, 00, 00
                  db   00, 00, 03, 00, 00, 03, 00, 00
                  db   00, 03, 03, 00, 00, 03, 03, 00
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 03, 00, 00, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   00, 00, 03, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
mapa          db   00, 00, 00, 00, 02, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 01, 02, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
              db   00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
.CODE
.STARTUP
inicio:
		mov AH, 00
		mov AL, 13
		int 10
		;;;;;;
		mov CX, 400
		mov AX, 64
		mov BX, 04
ciclo_mover_jug:
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		call delay
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add BX, 0008
		loop ciclo_mover_jug
		jmp fin

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
;;    - AX: x sprite
;;    - BX: y sprite
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
		int 03
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
		
fin:
.EXIT
END
