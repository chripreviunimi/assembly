;istruzioni programma principale
	.orig	x3000

	ld	r1,num1
	ld	r2,num2
	
	jsr 	subpr
;var e costanti programma principale
num1	.fill	#32000
num2	.fill	#32000


;sottoprogramma
subpr	add	r1,r1,#0
	brp	num1p
	
	add 	r2,r2,#0
	brnz	conc
	brzp	disc


num1p	add	r2,r2,#0
	brn	disc
	brp	conc

disc	and 	r0,r0,#0	;metto direttamente zero perché se sono discordi vuol dire che sono per forza nel range corretto
	ret
	
conc	add	r0,r1,r2
	brn	over
	brp	under
	ret 			;qua torno al chiamante perché se r0 è nullo vuol dire che la somma è stata tra due zeri quindi è andata a buon fine
under	and	r0,r0,#0
	add	r0,r0,#-1
	ret

over	and	r0,r0,#0
	add	r0,r0,#1
	ret

	
;variabili sottoprogramma
	.end