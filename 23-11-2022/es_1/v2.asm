;programma principale
	.orig x3000
	lea	r0,inizio
	lea	r1,fine 
	ld	r2,num1

	jsr 	subpr

;variabili programmma principale
num1	.fill 	4

inizio	.fill 	27
	.fill 	32
	.fill 	2
fine	.fill 	54



;sottoprogramma

subpr	st	r3,salvar3	;uso r3 come variabile per la somma
	st	r4,salvar4	;uso r4 come incrementatore
	st	r5,salvar5	;uso r5	come numero all'indirizzo di r0	
	
	not	r1,r1
	add	r1,r1,#1	;metto l'indirizzo di fine in negativo per compararlo
	not	r2,r2
	add	r2,r2,#1	;cambio il segno di r2 per andare a confrontare

	and	r3,r3,#0	;inizializzo la variabile per la somma
	and 	r4,r4,#0
	add	r4,r4,#1	;inizializzo a 1 il valore dell'indice
	and	r5,r5,#0	;inizializzo la variabile contenento il numero

	

ciclo	ldr	r5,r0,#0	;metto in r5 il valore all'indirizzo di r0
	add	r3,r5,r2	;vedo se la somma tra il valore all'indirizzo e quello negato è 0
	brz	trovato
	add	r3,r1,r0
	brz	notrov
	add	r0,r0,#1	;incremento l'indirizzo dell'array
	add	r4,r4,#1	;incremento il valore dell'indice
	brnzp	ciclo
	
trovato	and	r0,r0,#0
	add	r0,r0,r4
	brnzp	end
	

notrov	and	r0,r0,#0
	brnzp	end

end	ld	r3,salvar3
	ld	r4,salvar4
	ld	r5,salvar5
	ret


;varibili sottoprogramma	
 
salvar5	.blkw	1	
salvar3	.blkw	1	
salvar4	.blkw	1	

	.end

