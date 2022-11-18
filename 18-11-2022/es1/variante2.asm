	.orig	x3000

;qui istruzioni assembly del programma principale

call	jsr	subpr

;qui costanti e variabili del programma principale (non devono essere toccate dal fetch della cpu)
n1	lea	r3,num1
n2	lea	r4,num2

num1	.fill	#4
num2	.fill	#2

;************************************************ 
;qui inizia il sottoprogramma - istruzioni assembly del sottoprogramma

subpr	ldr r3,r1,#0
	ldr r4,r2,#0


	not 	r2,r2
	add 	r2,r2,#1	;se sono entrami positivi rendo negativo il secondo numero
	add 	r0,r1,r2
	brn 	neg	
	brp 	pos

	ret			;se arrivo qui vuol dire che sono uguali quindi ritorno subito r0

neg	and 	r0,r0,#0	;se il secondo � pi� grande del primo allora metto in r0 -1
	add 	r0,r0,#-1
	ret

pos	and 	r0,r0,#0	;se il primo � pi� grande del secondo allora metto in r0 1
	add 	r0,r0,#1
	ret
	


;qui costanti e variabili del sottoprogramma 
;*********************************************** 
	.end