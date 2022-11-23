;programma principale
	.orig	x3000
	lea	r0,inizio
	lea	r1,fine
	jsr subpr

;variabili programma principale
inizio	.fill 	1
	.fill 	2
	.fill	3
	.fill 	4
fine	.fill 	5


;sottoprogramma

subpr	and	r2,r2,#0	;inizializzo r2  come variabile d'appoggio partendo dall'alto (r0)
	and	r3,r3,#0	;inizializzo r3  come variabile d'appoggio partendo dal basso (r1)
	and	r4,r4,#0	;mi serve per sapere se ho finito o meno
ciclo	ldr	r2,r0,#0	;carico il primo numero in r2 "indicato"
	ldr	r3,r1,#0	;carico l'ultimo numero in r3 "indicato"
	str	r2,r1,#0	;scrivo il primo elem puntato nella cella indicata da r1
	str	r3,r0,#0	;scrivo l'ultimo elem puntato nella cell indicata da r0

	add	r0,r0,#1	;scorro in avanti
	add	r1,r1,#-1	;scorro indietro

	not	r1,r1
	add	r1,r1,#1	;nego r1
	add	r4,r0,r1	;sommo gli indirizzi
	brp	end
	not	r1,r1
	add	r1,r1,#1	;rimetto positivo r1
	
	brnzp 	ciclo	
	

end 	ld	r2,salvar2
	ld	r3,salvar3
	ld	r4,salvar4
	ret	

;variabili sottoprogramma

salvar2	.blkw	1	
salvar3	.blkw	1	
salvar4	.blkw	1	
	




	.end