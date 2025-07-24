;------------------------------------------------------------------------------
; ZONA I: Definicao de constantes
;         Pseudo-instrucao : EQU
;------------------------------------------------------------------------------
CR              		EQU     0Ah
FIM_TEXTO       		EQU     '@'
IO_READ         		EQU     FFFFh
IO_WRITE        		EQU     FFFEh
IO_STATUS       		EQU     FFFDh
INITIAL_SP      		EQU     FDFFh
CURSOR		    		EQU     FFFCh
CURSOR_INIT				EQU		FFFFh
MAP_LINE_LENGTH			EQU 	81d ; (8000h + 81h)
BARREIRA 				EQU 	'8'
COLISAO_PAREDE 			EQU 	1d
PONTO					EQU 	'.'
INIMIGO 				EQU 	'X'

; Posição Inicial PacMan
LINHA_INICIAL_PACMAN	EQU 	12d
COLUNA_INICIAL_PACMAN 	EQU		39d

; Movimentação PacMan
CIMA					EQU		1d
BAIXO 					EQU		2d
DIREITA					EQU 	3d
ESQUERDA				EQU 	4d

; Timer
TIMER_UNITS				EQU		FFF6h
ACTIVATE_TIMER 			EQU		FFF7h
ON						EQU 	1d 
OFF						EQU 	0d

; Tabela de Vitoria/Derrota
PONTOS_VITORIA  		EQU 	860d
SEM_VIDAS           	EQU     0d

;------------------------------------------------------------------------------
; ZONA II: definicao de variaveis
;          Pseudo-instrucoes : WORD - palavra (16 bits)
;                              STR  - sequencia de caracteres (cada ocupa 1 palavra: 16 bits).
;          Cada caracter ocupa 1 palavra
;------------------- 	-----------------------------------------------------------

				ORIG    8000h
Linha0   		STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO
Linha1   		STR 	'===========PONTOS: 000=======================================VIDAS: 3===========', FIM_TEXTO
Linha2   		STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO
Linha3   		STR 	'88..........88888888..............888888888888..............88888888..........88', FIM_TEXTO
Linha4   		STR 	'88..888....................8888..................8888....................888..88', FIM_TEXTO
Linha5   		STR 	'88..8...8888888888888888...8888...8888....8888...8888...8888888888888888...8..88', FIM_TEXTO
Linha6   		STR 	'88..8...8888888888888888...8888...88........88...8888...8888888888888888...8..88', FIM_TEXTO
Linha7   		STR 	'88............888..........8..8...88........88...8..8..........888............88', FIM_TEXTO
Linha8   		STR 	'88..8888......888.....88...8..8...888888888888...8..8...88.....888....888888..88', FIM_TEXTO
Linha9   		STR 	'88....88......888.....88................................88.....888....88......88', FIM_TEXTO
Linha10  		STR 	'88....88......888.....88...88888888888    88888888888...88.....888....88......88', FIM_TEXTO
Linha11  		STR 	'88888888......888.....88...88                      88...88.....888....8888888888', FIM_TEXTO
Linha12  		STR 	'......................88...88                      88...88......................', FIM_TEXTO
Linha13  		STR 	'88888888......888.....88...88                      88...88.....888....8888888888', FIM_TEXTO
Linha14  		STR 	'88....88......888.....88...88888888888888888888888888...88.....888....88......88', FIM_TEXTO
Linha15  		STR 	'88....88......888.....88................................88.....888....88......88', FIM_TEXTO
Linha16  		STR 	'88..8888......888.....88..88..88..888888888888..88..88..88.....888....888888..88', FIM_TEXTO
Linha17  		STR 	'88............888.........88..88..888888888888..88..88.........888............88', FIM_TEXTO
Linha18  		STR 	'88......8888888888888888..88..88................88..88..8888888888888888......88', FIM_TEXTO
Linha19  		STR 	'88..8...8888888888888888..88..88..888888888888..88..88..8888888888888888...8..88', FIM_TEXTO
Linha20  		STR 	'88..8.....................88..88..888888888888..88..88.....................8..88', FIM_TEXTO
Linha21  		STR 	'88..88..8888888888888888................................8888888888888888..88..88', FIM_TEXTO
Linha22  		STR 	'88........................888888....88888888....888888........................88', FIM_TEXTO
Linha23  		STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO

MapaVit0    	STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO
MapaVit1    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit2    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit3    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit4    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit5    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit6    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit7    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit8    	STR 	'88                                                                            88', FIM_TEXTO
MapaVit9    	STR 	'88            _   __   ____  ______  ____    ___    ____   ___    __          88', FIM_TEXTO
MapaVit10   	STR 	'88           | | / /  /  _/ /_  __/ / __ \  / _ \  /  _/  / _ |  / /          88', FIM_TEXTO
MapaVit11   	STR 	'88           | |/ /  _/ /    / /   / /_/ / / , _/ _/ /   / __ | /_/           88', FIM_TEXTO
MapaVit12   	STR 	'88           |___/  /___/   /_/    \____/ /_/|_| /___/  /_/ |_|(_)            88', FIM_TEXTO
MapaVit13   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit14   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit15   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit16   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit17   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit18   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit19   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit20   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit21   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit22   	STR 	'88                                                                            88', FIM_TEXTO
MapaVit23   	STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO

MapaDer0    	STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO
MapaDer1    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer2    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer3    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer4    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer5    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer6    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer7    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer8    	STR 	'88                                                                            88', FIM_TEXTO
MapaDer9    	STR 	'88              ___    ____  ___    ___    ____   ______  ___    __           88', FIM_TEXTO
MapaDer10   	STR 	'88             / _ \  / __/ / _ \  / _ \  / __ \ /_  __/ / _ |  / /           88', FIM_TEXTO
MapaDer11   	STR 	'88            / // / / _/  / , _/ / , _/ / /_/ /  / /   / __ | /_/            88', FIM_TEXTO
MapaDer12   	STR 	'88           /____/ /___/ /_/|_| /_/|_|  \____/  /_/   /_/ |_|(_)             88', FIM_TEXTO
MapaDer13   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer14   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer15   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer16   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer17   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer18   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer19   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer20   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer21   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer22   	STR 	'88                                                                            88', FIM_TEXTO
MapaDer23   	STR 	'88888888888888888888888888888888888888888888888888888888888888888888888888888888', FIM_TEXTO

PACMAN 			STR		'C', FIM_TEXTO
APAGAR 			WORD	' '
INIMIGOS		STR		'X', FIM_TEXTO

LinhaPacMan		WORD	LINHA_INICIAL_PACMAN
ColunaPacMan	WORD	COLUNA_INICIAL_PACMAN

IndicParede	 	WORD	0d

ClockTime 		WORD	4d ; entre 1-10 ms

DirecaoPacMan   WORD    0   ; 0=nenhuma, 1=cima, 2=baixo, 3=direita, 4=esquerda

; PONTUAÇÃO
PontoCentenas	WORD	19d   ; coluna do dígito das centenas
PontoDezenas	WORD	20d   ; coluna do dígito das dezenas
PontoUnidades	WORD	21d   ; coluna do dígito das unidades
LinhaPonto		WORD	1d    ; Linha1 (segunda linha do mapa)
Pontuacao		WORD	0d 

; VIDAS
LinhaVida		WORD 	1d
ColunaVida 		WORD	68d
Vidas           WORD    3d  

; PORTAL 
EntradPortalDir	WORD 	80d
SaidaPortalDir	WORD	0d
EntradPortalEsq	WORD	-1d
SaidaPortalEsq	WORD	79d

; TELA VITORIA / DERROTA 
MapaAtual		WORD	Linha0

; INIMIGO 1
LinhaInimigo1			WORD	4d
ColunaInimigo1			WORD	10d
ValorAnteriorInimigo1	WORD	'.'

; INIMIGO 2
LinhaInimigo2			WORD	4d
ColunaInimigo2			WORD	55d
ValorAnteriorInimigo2	WORD	'.'

; INIMIGO 3
LinhaInimigo3			WORD	17d
ColunaInimigo3			WORD	10d
ValorAnteriorInimigo3	WORD	'.'

; INIMIGO 4
LinhaInimigo4			WORD	17d
ColunaInimigo4			WORD	60d
ValorAnteriorInimigo4	WORD	'.'

; Variáveis temporárias para movimentação dos inimigos
LinhaAtualInimigo       WORD    0d
ColunaAtualInimigo      WORD    0d
ValorAnteriorInimigo    WORD    0d

;------------------------------------------------------------------------------
; ZONA III: definicao de tabela de interrupções
;------------------------------------------------------------------------------
				ORIG    FE00h
INT0			WORD	SetDirecaoCima
INT1			WORD	SetDirecaoBaixo
INT2			WORD	SetDirecaoDireita
INT3			WORD	SetDirecaoEsquerda

				ORIG	FE0Fh
INT15			WORD	Timer
;------------------------------------------------------------------------------
; ZONA IV: codigo
;        conjunto de instrucoes Assembly, ordenadas de forma a realizar
;        as funcoes pretendidas
;------------------------------------------------------------------------------
				ORIG    0000h
				JMP     Main

;------------------------------------------------------------------------------
; Rotina Imprime
;------------------------------------------------------------------------------
Imprime: 		PUSH	R1 ; linha
				PUSH	R2 ; coluna
				PUSH 	R3 ; ponteiro
				PUSH	R4

				SHL 	R1, 8d ; R1 = linha * 2^8 (256) = x
				OR 		R1, R2 ; R1 = x * R2 (coluna) = y 

Ciclo:			MOV		M[CURSOR], R1 ; move o cursor ate a posicao do R1
				MOV 	R4, M[R3]
				CMP 	R4, FIM_TEXTO
				JMP.Z 	FimImprime
				MOV		M[IO_WRITE], R4 ; imprime o caractere na tela
				INC 	R1
				INC 	R3
				JMP 	Ciclo				

FimImprime: 	POP 	R4
				POP 	R3
				POP		R2
				POP		R1
				
				RET

;------------------------------------------------------------------------------
; Rotina ImprimeMapa
;------------------------------------------------------------------------------
ImprimeMapa: 		PUSH	R1 ; linha
					PUSH	R2 ; coluna
					PUSH	R3 ; ponteiro
					PUSH	R4

					MOV 	R3, M[MapaAtual] ; ponteiro inicial (8000h)
					MOV 	R1, 0d ; linha
					
CicloImprimeMapa:	MOV		R2, 0d ; coluna
					CALL	Imprime

ProximaLinha:		MOV     R4, MAP_LINE_LENGTH
					ADD     R3, R4 

					INC		R1
					CMP		R1, 24d
					JMP.Z	FimImprimeMapa
					JMP		CicloImprimeMapa

FimImprimeMapa:		POP		R4
					POP		R3
					POP		R2
					POP		R1
					RET
					
;------------------------------------------------------------------------------
; Rotina ImprimePacMan
;------------------------------------------------------------------------------
ImprimePacMan:		PUSH	R1 ; linha
					PUSH	R2 ; coluna
					PUSH	R3 ; ponteiro
					PUSH	R4

					MOV     R3, PACMAN ; ponteiro para 'C'
					MOV     R1, M[LinhaPacMan] ; linha inicial escolhida para o pacman (12d)
					MOV     R2, M[ColunaPacMan] ; coluna inicial escolhida para o pacman (39d)
					CALL    Imprime

					POP		R4
					POP     R3
					POP     R2
					POP     R1
					RET

;------------------------------------------------------------------------------
; Rotina ApagarPacMan
;------------------------------------------------------------------------------	
ApagarPacMan: 		PUSH	R1
					PUSH	R2
					PUSH	R3

					MOV 	R3, M[APAGAR]
					MOV 	R1, M[LinhaPacMan]
					MOV 	R2, M[ColunaPacMan]

					SHL 	R1, 8d
					OR 		R1, R2 ; combina 
					MOV 	M[CURSOR], R1
					MOV 	M[IO_WRITE], R3	
				
					POP		R3
					POP 	R2
					POP 	R1
					RET		
							
;------------------------------------------------------------------------------
; Rotina MoveCima
;------------------------------------------------------------------------------
MoveCima:			PUSH	R1
					PUSH	R2

					DEC 	M[LinhaPacMan]

					CALL 	VerificaColisao

					MOV 	R1, M[IndicParede]
					CMP 	R1, COLISAO_PAREDE
					JMP.Z 	CancelaMovCima

					JMP 	FimMoveCima

CancelaMovCima: 	INC 	M[LinhaPacMan]
					JMP 	FimMoveCima

FimMoveCima:		POP		R2
					POP 	R1
					RET

;------------------------------------------------------------------------------
; Rotina MoveBaixo
;------------------------------------------------------------------------------
MoveBaixo:			PUSH	R1
					PUSH	R2

					INC 	M[LinhaPacMan]

					CALL 	VerificaColisao

					MOV 	R1, M[IndicParede]
					CMP 	R1, COLISAO_PAREDE
					JMP.Z 	CancelaMovBaixo

					JMP 	FimMoveBaixo

CancelaMovBaixo: 	DEC 	M[LinhaPacMan]
					JMP 	FimMoveBaixo

FimMoveBaixo:		POP		R2
					POP 	R1
					RET

;------------------------------------------------------------------------------
; Rotina MoveDireita
;------------------------------------------------------------------------------
MoveDireita:		PUSH	R1
					PUSH	R2

					INC 	M[ColunaPacMan]

					CALL	Portal
					CALL 	VerificaColisao

					MOV 	R1, M[IndicParede]
					CMP 	R1, COLISAO_PAREDE
					JMP.Z 	CancelaMovDireita

					JMP 	FimMoveDireita

CancelaMovDireita: 	DEC 	M[ColunaPacMan]
					JMP 	FimMoveDireita

FimMoveDireita:		POP		R2
					POP 	R1
					RET

;------------------------------------------------------------------------------
; Rotina MoveEsquerda
;------------------------------------------------------------------------------
MoveEsquerda:		PUSH	R1
					PUSH	R2

					DEC 	M[ColunaPacMan]

					CALL	Portal
					CALL 	VerificaColisao

					MOV 	R1, M[IndicParede]
					CMP 	R1, COLISAO_PAREDE
					JMP.Z 	CancelaMovEsquerda

					JMP 	FimMoveEsquerda

CancelaMovEsquerda: INC 	M[ColunaPacMan]
					JMP 	FimMoveEsquerda

FimMoveEsquerda:	POP		R2
					POP 	R1
					RET 

;-----------------------------------------------------------------------------
; Rotina SetDirecaoCima
;-----------------------------------------------------------------------------
SetDirecaoCima:		PUSH	R1

					MOV		R1, CIMA
					MOV		M[DirecaoPacMan], R1

					POP		R1
					RTI

;-----------------------------------------------------------------------------
; Rotina SetDirecaoBaixo
;-----------------------------------------------------------------------------
SetDirecaoBaixo:	PUSH	R1

					MOV		R1, BAIXO
					MOV		M[DirecaoPacMan], R1

					POP		R1
					RTI

;-----------------------------------------------------------------------------
; Rotina SetDirecaoDireita
;-----------------------------------------------------------------------------
SetDirecaoDireita:	PUSH	R1

					MOV		R1, DIREITA
					MOV		M[DirecaoPacMan], R1

					POP		R1
					RTI

;-----------------------------------------------------------------------------
; Rotina SetDirecaoEsquerda
;-----------------------------------------------------------------------------
SetDirecaoEsquerda:	PUSH	R1

					MOV		R1, ESQUERDA
					MOV		M[DirecaoPacMan], R1

					POP		R1
					RTI

;-----------------------------------------------------------------------------
; Rotina Timer 
;-----------------------------------------------------------------------------
Timer:          PUSH    R1
                PUSH    R2

				CALL 	ApagarPacMan

                ; Verifica a direção atual
                MOV     R1, M[DirecaoPacMan]

                CMP     R1, CIMA
                CALL.Z  MoveCima

                CMP     R1, BAIXO
                CALL.Z  MoveBaixo

                CMP     R1, DIREITA
                CALL.Z  MoveDireita

                CMP     R1, ESQUERDA
                CALL.Z  MoveEsquerda

				CALL 	ImprimePacMan

				; Atualiza e movimenta os 4 inimigos
				; Inimigo 1
				CALL    AtualizaTempInimigo1
				CALL    PersegueInimigo
				CALL    VerificaColisaoInimigo
				CALL    AtualizaPosicaoInimigo1
				
				; Inimigo 2
				CALL    AtualizaTempInimigo2
				CALL    PersegueInimigo2
				CALL    VerificaColisaoInimigo
				CALL    AtualizaPosicaoInimigo2

				; Inimigo 3
				CALL    AtualizaTempInimigo3
				CALL    PersegueInimigo3
				CALL    VerificaColisaoInimigo
				CALL    AtualizaPosicaoInimigo3

				; Inimigo 4
				CALL    AtualizaTempInimigo4
				CALL    PersegueInimigo4
				CALL    VerificaColisaoInimigo
				CALL    AtualizaPosicaoInimigo4

                ; Reconfigura o temporizador para o próximo ciclo
                CALL    ConfigTimer

                POP     R2
                POP     R1
               	RTI

;-----------------------------------------------------------------------------
; Rotina ConfigureTimer 
;-----------------------------------------------------------------------------
ConfigTimer: 	PUSH 	R1
				PUSH 	R2
				PUSH 	R3

				MOV 	R1, M[ClockTime]
				MOV		M[TIMER_UNITS], R1

				MOV 	R1, ON
				MOV 	M[ACTIVATE_TIMER], R1

FimConfigTimer:	POP 	R3
				POP 	R2
				POP		R1
				RET

;-----------------------------------------------------------------------------
; Rotina VerificaColisao
;-----------------------------------------------------------------------------
VerificaColisao: 	PUSH 	R1 ; linha
					PUSH 	R2 ; coluna
					PUSH	R3
					PUSH 	R4 ; salva o caracter atual do mapa (posicao do pacman) 

					MOV 	R1, M[LinhaPacMan]
					MOV 	R2, M[ColunaPacMan]

					MOV 	R3, Linha0 ; 8000h
					MOV 	R4, MAP_LINE_LENGTH ; comprimento de cada linha = 81d
					MUL 	R1, R4 ; linha * 81
					ADD 	R3, R4  
					ADD 	R3, R2	; guarda no R3 o endereço da posição no mapa

					; Verifica se é uma barreira '8'
					MOV 	R4, M[R3]
					CMP 	R4, BARREIRA
					JMP.Z 	Colisao

					; Verifica se é um inimigo 'X'
					CALL 	VerificaColisaoInimigo
					JMP.Z	FimVerificaColisao

					;Compara a posicao atual com o '.' e contabiliza
					CMP 	R4, PONTO
					JMP.NZ	PosicaoVazia
					
					CALL.Z 	Pontos
					MOV		R4, M[APAGAR] 
					MOV		M[R3], R4 ; apaga o ponto para não ser contabilizado novamente

PosicaoVazia:		MOV 	R4, 0	
					MOV 	M[IndicParede], R4
					JMP 	FimVerificaColisao

Colisao: 			MOV 	R4, COLISAO_PAREDE
					MOV 	M[IndicParede], R4

FimVerificaColisao:	POP 	R4
					POP 	R3
					POP 	R2
					POP 	R1
					RET

;------------------------------------------------------------------------------
; Rotina ImprimeInimigos
;------------------------------------------------------------------------------
ImprimeInimigos:	PUSH	R1
					PUSH	R2
					PUSH	R3
					PUSH	R4

					; Inimigo 1
					MOV		R3, INIMIGOS
					MOV		R1, M[LinhaInimigo1]
					MOV		R2, M[ColunaInimigo1]
					CALL	Imprime

					; Inimigo 2		
					MOV		R3, INIMIGOS
					MOV		R1, M[LinhaInimigo2]
					MOV		R2, M[ColunaInimigo2]
					CALL	Imprime

					; Inimigo 3
					MOV		R3, INIMIGOS
					MOV		R1, M[LinhaInimigo3]
					MOV		R2, M[ColunaInimigo3]
					CALL	Imprime

					; Inimigo 4
					MOV		R3, INIMIGOS
					MOV		R1, M[LinhaInimigo4]
					MOV		R2, M[ColunaInimigo4]
					CALL	Imprime

					POP		R4
					POP		R3
					POP		R2
					POP		R1
					RET

;------------------------------------------------------------------------------
; Rotina Verifica Colisao Inimigo
; Verifica se a posição atual do PacMan é mesma posição do inimigo
;------------------------------------------------------------------------------
VerificaColisaoInimigo:	PUSH	R1
						PUSH	R2

						; Verifica Inimigo 1
						MOV		R1, M[LinhaPacMan]
						CMP		R1, M[LinhaInimigo1]
						JMP.NZ	VerificaInimigo2 ; Se a linha for diferente, vai para o próximo inimigo

						MOV		R2, M[ColunaPacMan] ; Se for igual, compara a coluna
						CMP		R2, M[ColunaInimigo1]
						CALL.Z	PerderVida ; Reseta Pacman e perde vida
						JMP.Z	FimColisaoInimigo

VerificaInimigo2:		MOV		R1, M[LinhaPacMan]
						CMP		R1, M[LinhaInimigo2]
						JMP.NZ	VerificaInimigo3

						MOV		R2, M[ColunaPacMan]
						CMP		R2, M[ColunaInimigo2]
						CALL.Z	PerderVida
						JMP.Z	FimColisaoInimigo

VerificaInimigo3:		MOV		R1, M[LinhaPacMan]
						CMP		R1, M[LinhaInimigo3]
						JMP.NZ	VerificaInimigo4

						MOV		R2, M[ColunaPacMan]
						CMP		R2, M[ColunaInimigo3]
						CALL.Z	PerderVida
						JMP.Z	FimColisaoInimigo

VerificaInimigo4:		MOV		R1, M[LinhaPacMan]
						CMP		R1, M[LinhaInimigo4]
						JMP.NZ	FimColisaoInimigo

						MOV		R2, M[ColunaPacMan]
						CMP		R2, M[ColunaInimigo4]
						CALL.Z	PerderVida

FimColisaoInimigo:		POP		R2
						POP		R1
						RET

;------------------------------------------------------------------------------
; Rotina PacMan Posição Inicial - Caso Morra
;------------------------------------------------------------------------------
ResetarPacman:  PUSH R1
                PUSH R2

                ; Apaga Pacman da posição atual
                CALL ApagarPacMan

                ; Reseta linha e coluna
                MOV R1, LINHA_INICIAL_PACMAN
                MOV M[LinhaPacMan], R1
                MOV R1, COLUNA_INICIAL_PACMAN
                MOV M[ColunaPacMan], R1

                ; Imprime novamente o Pacman
                CALL ImprimePacMan

				; Imprime novamente o inimigo
				CALL ImprimeInimigos

                POP R2
                POP R1
                RET

;-----------------------------------------------------------------------------
; Rotina Pontuação
;-----------------------------------------------------------------------------
Pontos:			PUSH R1
				PUSH R2
				PUSH R3
				PUSH R4

				INC 	M[Pontuacao] ; Função chamada, pontuação incrementada

				; Centenas
				MOV		R1, M[Pontuacao]
				MOV		R2, 100d
				DIV		R1, R2 ; R1 = centenas, R2 = resto (110, resto = 10)

				MOV		R3, M[LinhaPonto] ; Linha da pontuação 1d
				MOV		R4, M[PontoCentenas] ; Coluna das centenas 19d

				SHL		R3, 8d 
				OR		R3, R4 ; Combina = Posição do cursor
				MOV		M[CURSOR], R3             
				ADD		R1, '0' ; Converte número para ASCII - 48
				MOV		M[IO_WRITE], R1           

				; Dezenas	
				MOV		R1, R2
				MOV		R2, 10d
				DIV		R1, R2 ; R1 = dezenas, R2 = unidades

				MOV		R3, M[LinhaPonto]
				MOV		R4, M[PontoDezenas]

				SHL		R3, 8d 
				OR		R3, R4 
				MOV		M[CURSOR], R3 
				ADD		R1, '0'
				MOV		M[IO_WRITE], R1          

				; Unidades
				MOV		R3, M[LinhaPonto]
				MOV		R4, M[PontoUnidades]

				SHL		R3, 8d
				OR		R3, R4
				MOV		M[CURSOR], R3
				ADD		R2, '0' ; Converte a unidade em ASCII (R2 + 48)
				MOV		M[IO_WRITE], R2           

				; Verifica se ganhou o jogo
				MOV     R1, M[Pontuacao]
				CMP     R1, PONTOS_VITORIA
				CALL.Z  TelaVitoria

				POP		R4
				POP		R3
				POP		R2
				POP		R1
				RET

;------------------------------------------------------------------------------
; Rotina Vidas
;------------------------------------------------------------------------------
PerderVida:     PUSH R1

                ; Diminui vida
                DEC     M[Vidas]
                CALL    AtualizaVidas    

                MOV     R1, M[Vidas]
                CMP     R1, SEM_VIDAS
                CALL.Z  TelaDerrota

                CALL    ResetarPacman

                POP R1
                RET

;------------------------------------------------------------------------------
; Rotina Vidas - Atualiza o número de vidas
;------------------------------------------------------------------------------
AtualizaVidas:		PUSH R1
					PUSH R2
					PUSH R3

					MOV		R1, M[LinhaVida] ; Linha das vidas 1d
					MOV		R2, M[ColunaVida] ; Coluna das vidas 68d
					MOV		R3, M[Vidas] 
					ADD		R3, '0'	; Converte ASCII: 0 = 48, logo, 3(Vidas) + 48 = 51 = 3 vidas 

					SHL		R1, 8d
					OR		R1, R2
					MOV		M[CURSOR], R1
					MOV		M[IO_WRITE], R3

					POP R3
					POP R2
					POP R1
					RET

;------------------------------------------------------------------------------
; Rotina Portal
;------------------------------------------------------------------------------
Portal:				PUSH	R1 ; linha 
					PUSH	R2 ; coluna

					MOV		R1, M[LinhaPacMan]
					MOV		R2, M[ColunaPacMan]

					; Se estiver na coluna 0, transporta para 79
					CMP		R2, M[EntradPortalEsq]
					JMP.NZ	VerificaColuna79
					MOV		R2, M[SaidaPortalEsq]
					MOV		M[ColunaPacMan], R2
					JMP		FimPortal

VerificaColuna79:	CMP		R2, M[EntradPortalDir]
					JMP.NZ	FimPortal
					MOV		R2, M[SaidaPortalDir]
					MOV		M[ColunaPacMan], R2

FimPortal:			POP		R2
					POP		R1
					RET

;------------------------------------------------------------------------------
; Rotina TelaVitoria
;------------------------------------------------------------------------------
TelaVitoria:        PUSH    R1

                    MOV     R1, MapaVit0 ; Início da tela de vitória
                    MOV     M[MapaAtual], R1 ; Define qual mapa imprimir
                    CALL    ImprimeMapa         

                    CALL    PararJogo

                    POP     R1
                    RET

;------------------------------------------------------------------------------
; Rotina TelaDerrota
;------------------------------------------------------------------------------
TelaDerrota:        PUSH    R1

                    MOV     R1, MapaDer0 ; Início da tela de derrota
                    MOV     M[MapaAtual], R1 ; Define qual mapa imprimir
                    CALL    ImprimeMapa           

                    CALL    PararJogo

                    POP     R1
                    RET

;------------------------------------------------------------------------------
; Rotina MoverInimigoCima
;------------------------------------------------------------------------------
MoverInimigoCima:		PUSH	R1
						PUSH	R2
						PUSH	R3
						PUSH	R4

						MOV		R1, M[LinhaAtualInimigo]
						DEC		R1
						MOV		R2, M[ColunaAtualInimigo]

						; Endereço da nova posição no mapa
						MOV		R3, Linha0
						MOV		R4, MAP_LINE_LENGTH ; comprimento de cada linha = 81d
						MUL		R1, R4 ; linha * 81
						ADD		R3, R4
						ADD		R3, R2 ; guarda no R3 o endereço da posição no mapa

						; Colisão 
						MOV		R4, M[R3]
						CMP		R4, BARREIRA
						JMP.Z	FimMoverInimigoCima

						; Salva o conteúdo da nova posição
						MOV		M[ValorAnteriorInimigo], R4

						; Apagar a posição anterior
						CALL    ApagarInimigoAtual

						; Atualiza posição
						DEC		M[LinhaAtualInimigo]

						MOV		R3, INIMIGOS
						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						CALL	Imprime

FimMoverInimigoCima:	POP		R4
						POP		R3
						POP		R2
						POP		R1
						RET

;------------------------------------------------------------------------------
; Rotina MoverInimigoBaixo
;------------------------------------------------------------------------------
MoverInimigoBaixo:		PUSH	R1
						PUSH	R2
						PUSH	R3
						PUSH	R4

						MOV		R1, M[LinhaAtualInimigo]
						INC		R1
						MOV		R2, M[ColunaAtualInimigo]

						; Endereço da nova posição no mapa
						MOV		R3, Linha0
						MOV		R4, MAP_LINE_LENGTH ; comprimento de cada linha = 81d
						MUL		R1, R4 ; linha * 81
						ADD		R3, R4
						ADD		R3, R2 ; guarda no R3 o endereço da posição no mapa

						; Colisão 
						MOV		R4, M[R3]
						CMP		R4, BARREIRA
						JMP.Z	FimMoverInimigoBaixo

						; Salva o conteúdo da nova posição
						MOV		M[ValorAnteriorInimigo], R4

						; Apagar a posição anterior
						CALL    ApagarInimigoAtual

						; Atualiza posição
						INC		M[LinhaAtualInimigo]

						MOV		R3, INIMIGOS
						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						CALL	Imprime

FimMoverInimigoBaixo:	POP		R4
						POP		R3
						POP		R2
						POP		R1
						RET

;------------------------------------------------------------------------------
; Rotina MoverInimigoDireita
;------------------------------------------------------------------------------
MoverInimigoDireita:	PUSH	R1
						PUSH	R2
						PUSH	R3
						PUSH	R4

						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						INC		R2

						; Endereço da nova posição no mapa
						MOV		R3, Linha0
						MOV		R4, MAP_LINE_LENGTH ; comprimento de cada linha = 81d
						MUL		R1, R4 ; linha * 81
						ADD		R3, R4
						ADD		R3, R2 ; guarda no R3 o endereço da posição no mapa

						; Colisão 
						MOV		R4, M[R3]
						CMP		R4, BARREIRA
						JMP.Z	FimMoverInimigoDireita

						; Salva o conteúdo da nova posição
						MOV		M[ValorAnteriorInimigo], R4

						; Apagar a posição anterior
						CALL    ApagarInimigoAtual

						; Atualiza posição
						INC		M[ColunaAtualInimigo]

						MOV		R3, INIMIGOS
						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						CALL	Imprime

FimMoverInimigoDireita:	POP		R4
						POP		R3
						POP		R2
						POP		R1
						RET

;------------------------------------------------------------------------------
; Rotina MoverInimigoEsquerda
;------------------------------------------------------------------------------
MoverInimigoEsquerda:	PUSH	R1
						PUSH	R2
						PUSH	R3
						PUSH	R4

						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						DEC		R2

						; Endereço da nova posição no mapa
						MOV		R3, Linha0
						MOV		R4, MAP_LINE_LENGTH ; comprimento de cada linha = 81d
						MUL		R1, R4 ; linha * 81
						ADD		R3, R4
						ADD		R3, R2 ; guarda no R3 o endereço da posição no mapa

						; Colisão 
						MOV		R4, M[R3]
						CMP		R4, BARREIRA
						JMP.Z	FimMoverInimigoEsquerda

						; Salva o conteúdo da nova posição
						MOV		M[ValorAnteriorInimigo], R4

						; Apagar a posição anterior
						CALL    ApagarInimigoAtual

						; Atualiza posição
						DEC		M[ColunaAtualInimigo]

						MOV		R3, INIMIGOS
						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						CALL	Imprime

FimMoverInimigoEsquerda:POP		R4
						POP		R3
						POP		R2
						POP		R1
						RET
;------------------------------------------------------------------------------
; Rotina ApagarInimigoAtual - Sensação de Movimento
;------------------------------------------------------------------------------
ApagarInimigoAtual:		PUSH	R1
						PUSH	R2
						PUSH	R3

						MOV		R1, M[LinhaAtualInimigo]
						MOV		R2, M[ColunaAtualInimigo]
						MOV		R3, M[ValorAnteriorInimigo]

						SHL		R1, 8d
						OR		R1, R2
						MOV		M[CURSOR], R1
						MOV		M[IO_WRITE], R3

						POP		R3
						POP		R2
						POP		R1
						RET

;------------------------------------------------------------------------------
; Rotina PersegueInimigo (Perseguição)
;------------------------------------------------------------------------------
PersegueInimigo:			PUSH	R1
							PUSH	R2
							PUSH	R3 ; Nova posição

							; Comparar colunas do Inimigo x PacMan
							MOV		R1, M[ColunaAtualInimigo]
							MOV		R2, M[ColunaPacMan]

							CMP		R1, R2
							JMP.Z	TentaLinha ; se for verdade, então tenta andar linha

							; Decrementa a coluna (Esquerda)
							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (ColunaInimigo - 1) com colunaPacMan
							JMP.Z	TentaEsquerda ; Se for verdade, esquerda - Se não, direita

							JMP		TentaDireita

TentaEsquerda:				CALL	MoverInimigoEsquerda
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha ; Se não mudou a posição = colisão detectada, agora tenta pela linha
							JMP		FimMovimentoAlvo

TentaDireita:				CALL	MoverInimigoDireita
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha ; Se não mudou a posição = colisão detectada, agora tenta pela linha
							JMP		FimMovimentoAlvo

TentaLinha:					MOV		R1, M[LinhaAtualInimigo]
							MOV		R2, M[LinhaPacMan]

							CMP		R1, R2 ; Compara as linhas
							JMP.Z	FimMovimentoAlvo

							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (LinhaInimigo - 1) com LinhaPacMan	
							JMP.Z	TentaCima

							JMP		TentaBaixo

TentaCima:					CALL	MoverInimigoCima
							JMP		FimMovimentoAlvo

TentaBaixo:					CALL	MoverInimigoBaixo

FimMovimentoAlvo:			POP		R3
							POP		R2
							POP		R1
							RET

;------------------------------------------------------------------------------
; PersegueInimigo2 
;------------------------------------------------------------------------------
PersegueInimigo2:			PUSH	R1
							PUSH	R2
							PUSH	R3 ; Nova posição

                            ; Comparar colunas do Inimigo x PacMan
							MOV		R1, M[ColunaAtualInimigo]
							MOV		R2, M[ColunaPacMan]

							CMP		R1, R2
							JMP.Z	TentaLinha2 ; se for verdade, então tenta andar linha

                            ; Tenta mover para ESQUERDA
							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (ColunaInimigo - 1) com colunaPacMan
							JMP.Z	TentaDireita2

							JMP		TentaEsquerda2

TentaEsquerda2:				CALL	MoverInimigoEsquerda
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha2 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo2

TentaDireita2:				CALL	MoverInimigoDireita
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha2 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo2

TentaLinha2:					MOV		R1, M[LinhaAtualInimigo]
							MOV		R2, M[LinhaPacMan]

							CMP		R1, R2 ; Compara as linhas
							JMP.Z	FimMovimentoAlvo2

							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (LinhaInimigo - 1) com LinhaPacMan	
							JMP.Z	TentaCima2

							JMP		TentaBaixo2

TentaCima2:					CALL	MoverInimigoCima
							JMP		FimMovimentoAlvo2

TentaBaixo2:					CALL	MoverInimigoBaixo

FimMovimentoAlvo2:			POP		R3
							POP		R2
							POP		R1
							RET

;------------------------------------------------------------------------------
; PersegueInimigo3
;------------------------------------------------------------------------------
PersegueInimigo3:			PUSH	R1
							PUSH	R2
							PUSH	R3 ; Nova posição

                            ; Comparar colunas do Inimigo x PacMan
							MOV		R1, M[ColunaAtualInimigo]
							MOV		R2, M[ColunaPacMan]

							CMP		R1, R2
							JMP.Z	TentaLinha3 ; se for verdade, então tenta andar linha

                            ; Tenta mover para CIMA
							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (ColunaInimigo - 1) com colunaPacMan
							JMP.Z	TentaEsquerda3

							JMP		TentaCima3

TentaCima3:					CALL	MoverInimigoCima
							MOV		R3, M[LinhaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha3 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo3

TentaEsquerda3:				CALL	MoverInimigoEsquerda
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha3 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo3

TentaLinha3:					MOV		R1, M[LinhaAtualInimigo]
							MOV		R2, M[LinhaPacMan]

							CMP		R1, R2 ; Compara as linhas
							JMP.Z	FimMovimentoAlvo3

							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (LinhaInimigo - 1) com LinhaPacMan	
							JMP.Z	TentaBaixo3

							JMP		TentaDireita3

TentaBaixo3:					CALL	MoverInimigoBaixo
							JMP		FimMovimentoAlvo3

TentaDireita3:				CALL	MoverInimigoDireita

FimMovimentoAlvo3:			POP		R3
							POP		R2
							POP		R1
							RET

;------------------------------------------------------------------------------
; PersegueInimigo4 
;------------------------------------------------------------------------------
PersegueInimigo4:			PUSH	R1
							PUSH	R2
							PUSH	R3 ; Nova posição

                            ; Comparar colunas do Inimigo x PacMan
							MOV		R1, M[ColunaAtualInimigo]
							MOV		R2, M[ColunaPacMan]

							CMP		R1, R2
							JMP.Z	TentaLinha4 ; se for verdade, então tenta andar linha

                            ; Tenta mover para ESQUERDA
							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (ColunaInimigo - 1) com colunaPacMan
							JMP.Z	TentaDireita4

							JMP		TentaEsquerda4

TentaEsquerda4:				CALL	MoverInimigoEsquerda
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha4 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo4

TentaDireita4:				CALL	MoverInimigoDireita
							MOV		R3, M[ColunaAtualInimigo]
							CMP		R3, R1
							JMP.Z	TentaLinha4 ; Se não mudou a posição, tenta pela linha
							JMP		FimMovimentoAlvo4

TentaLinha4:					MOV		R1, M[LinhaAtualInimigo]
							MOV		R2, M[LinhaPacMan]

							CMP		R1, R2 ; Compara as linhas
							JMP.Z	FimMovimentoAlvo4

							MOV		R3, R1
							DEC		R3
							CMP		R3, R2 ; Compara (LinhaInimigo - 1) com LinhaPacMan	
							JMP.Z	TentaCima4

							JMP		TentaBaixo4

TentaCima4:					CALL	MoverInimigoCima
							JMP		FimMovimentoAlvo4

TentaBaixo4:					CALL	MoverInimigoBaixo

FimMovimentoAlvo4:			POP		R3
							POP		R2
							POP		R1
							RET

;------------------------------------------------------------------------------
; Rotina Temporária dos Inimigos - Para impressão da comida / vazio novamente
;------------------------------------------------------------------------------
						; Inimigo 1
AtualizaTempInimigo1:	MOV		R1, M[LinhaInimigo1]
						MOV		M[LinhaAtualInimigo], R1 ; Salva a linha na variável temporária
						MOV		R1, M[ColunaInimigo1]
						MOV		M[ColunaAtualInimigo], R1 ; Salva a coluna na variável temporária

						MOV		R1, M[ValorAnteriorInimigo1]
						MOV		M[ValorAnteriorInimigo], R1 ; Salva a comida / vazio na variável temporária
						RET

						; Inimigo 2
AtualizaTempInimigo2:	MOV		R1, M[LinhaInimigo2]
						MOV		M[LinhaAtualInimigo], R1
						MOV		R1, M[ColunaInimigo2]
						MOV		M[ColunaAtualInimigo], R1

						MOV		R1, M[ValorAnteriorInimigo2]
						MOV		M[ValorAnteriorInimigo], R1
						RET

						; Inimigo 3
AtualizaTempInimigo3:	MOV		R1, M[LinhaInimigo3]
						MOV		M[LinhaAtualInimigo], R1
						MOV		R1, M[ColunaInimigo3]
						MOV		M[ColunaAtualInimigo], R1

						MOV		R1, M[ValorAnteriorInimigo3]
						MOV		M[ValorAnteriorInimigo], R1
						RET

						; Inimigo 4
AtualizaTempInimigo4:	MOV		R1, M[LinhaInimigo4]
						MOV		M[LinhaAtualInimigo], R1
						MOV		R1, M[ColunaInimigo4]
						MOV		M[ColunaAtualInimigo], R1

						MOV		R1, M[ValorAnteriorInimigo4]
						MOV		M[ValorAnteriorInimigo], R1
						RET

;------------------------------------------------------------------------------
; Rotina para Atualizar a Posição Real dos Inimigos - Salva os Resultados Reais
;------------------------------------------------------------------------------
						; Inimigo 1
AtualizaPosicaoInimigo1:MOV		R1, M[LinhaAtualInimigo]
						MOV		M[LinhaInimigo1], R1
						MOV		R1, M[ColunaAtualInimigo]
						MOV		M[ColunaInimigo1], R1

						MOV		R1, M[ValorAnteriorInimigo]
						MOV		M[ValorAnteriorInimigo1], R1
						RET

						; Inimigo 2
AtualizaPosicaoInimigo2:MOV		R1, M[LinhaAtualInimigo]
						MOV		M[LinhaInimigo2], R1
						MOV		R1, M[ColunaAtualInimigo]
						MOV		M[ColunaInimigo2], R1

						MOV		R1, M[ValorAnteriorInimigo]
						MOV		M[ValorAnteriorInimigo2], R1
						RET

						; Inimigo 3
AtualizaPosicaoInimigo3:MOV		R1, M[LinhaAtualInimigo]
						MOV		M[LinhaInimigo3], R1
						MOV		R1, M[ColunaAtualInimigo]
						MOV		M[ColunaInimigo3], R1

						MOV		R1, M[ValorAnteriorInimigo]
						MOV		M[ValorAnteriorInimigo3], R1
						RET

						; Inimigo 4
AtualizaPosicaoInimigo4:MOV		R1, M[LinhaAtualInimigo]
						MOV		M[LinhaInimigo4], R1
						MOV		R1, M[ColunaAtualInimigo]
						MOV		M[ColunaInimigo4], R1

						MOV		R1, M[ValorAnteriorInimigo]
						MOV		M[ValorAnteriorInimigo4], R1
						RET


;------------------------------------------------------------------------------
; Função Main
;------------------------------------------------------------------------------
Main:			ENI

				;----------------------------------------------------------------
				; Inicializacao de registradores / enderecos importantes do P3
				; (este codigo tem que fazer parte de todos os arquivos assembly)
				;----------------------------------------------------------------
				MOV		R1, INITIAL_SP
				MOV		SP, R1		 		; We need to initialize the stack
				MOV		R1, CURSOR_INIT		; We need to initialize the cursor 
				MOV		M[ CURSOR ], R1		; with value CURSOR_INIT
				
				CALL	ImprimeMapa
				CALL	ImprimePacMan
				CALL 	ImprimeInimigos
				CALL 	ConfigTimer
				
				;--------------------------------------------------------------
				; Agora o codigo fica em ciclo infinito esperando que uma 
				; interrupcao seja accionada
				;--------------------------------------------------------------
Cycle: 			JMP		Cycle	
Halt:           JMP		Halt
PararJogo:      JMP     Halt