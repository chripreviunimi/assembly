	.orig	x3000

;qui istruzioni assembly del programma principale	

call	jsr	subpr

;qui costanti e variabili del programma principale (non devono essere toccate dal fetch della cpu)
n1	lea	r1,i1
n2	lea	r2,i2

	

num1	.fill	#4
num2	.fill	#2

i1	.fill	num1
i2	.fill	num2

;************************************************ 
;qui inizia il sottoprogramma - istruzioni assembly del sottoprogramma

subpr	
			;r1 = ind(ind(num2))
	ldr r1,r3,#0	;r1=ind(num2)
	ldr r1,r1,#	;r1=num1

		;r2 = ind(ind(num2))
	ldr r2,r4,#0	;r2=ind(num2)
	ldr r2,r2,#	;r2=num1

	ldr r2,r2,#0


	not 	r2,r2
	add 	r2,r2,#1	;sono entrami positivi rendo negativo il secondo numero
	add 	r0,r1,r2
	brn 	neg	
	brp 	pos

	ret			;se arrivo qui vuol dire che sono uguali quindi ritorno subito r0

neg	and 	r0,r0,#0	;se il secondo è più grande del primo allora metto in r0 -1
	add 	r0,r0,#-1
	ret

pos	and 	r0,r0,#0	;se il primo è più grande del secondo allora metto in r0 1
	add 	r0,r0,#1
	ret
	


;qui costanti e variabili del sottoprogramma 
;*********************************************** 
	.end