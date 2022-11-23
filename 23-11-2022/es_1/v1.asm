;programma principale
	.orig x3000
	lea	r0,array 
	ld	r1,num1

	jsr 	subpr

;variabili programmma principale
num1	.fill 	54

array	.fill 	27
	.fill 	32
	.fill 	2
	.fill 	54
	.fill 	0


;sottoprogramma

subpr	st	r2,salvar2
	st	r3,salvar3
	st	r4,salvar4

	not	r1,r1
	add	r1,r1,#1	;cambio il segno di r1 per andare a confrontare
	and 	r4,r4,#0
	add	r4,r4,#1	;inizializzo a 1 il valore dell'indice
	and	r2,r2,#0	;inizializzo la variabile contenento il numero
	and	r3,r3,#0	;inizializzo la variabile per la somma

ciclo	ldr	r2,r0,#0	;metto in r2 il valore all'indirizzo di r0
	brz	notrov	
	add	r3,r2,r1	;vedo se la somma tra il valore all'indirizzo e quello negato è 0
	brz	trovato
	add	r0,r0,#1	;incremento l'indirizzo dell'array	
	add	r4,r4,#1	;incremento il valore dell'indice
	brnzp	ciclo
	
trovato	and	r0,r0,#0
	add	r0,r0,r4
	brnzp	fine
	

notrov	and	r0,r0,#0
	brnzp	fine

fine	ld	r2,salvar2
	ld	r3,salvar3
	ld	r4,salvar4
	ret


;varibili sottoprogramma	
 
salvar2	.blkw	1	;uso r2	come numero all'indirizzo di r0	
salvar3	.blkw	1	;uso r3 come variabile per la somma
salvar4	.blkw	1	;uso r4 come incrementatore

	.end