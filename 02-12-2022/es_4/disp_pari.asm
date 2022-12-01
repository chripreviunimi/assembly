;istruzioni programma principale
	.orig	x3000
	lea	r0,array
	lea	r1,ultimo
	jsr	subpr


;variabili programma principale
array	.fill	6
	.fill	3
ultimo	.fill	5


;istruzioni sottoprogramma

subpr	st	r2,salvar2
	st	r3,salvar3
	st	r4,salvar4
	st	r5,salvar5

	not	r1,r1
	add	r1,r1,#1	;nego l'indirizzo dell'ultimo numero dell'array
	and	r4,r4,#0	;per inizializzare il contatore dei pari
	and	r3,r3,#0	;per inizializzare il contatore dei dispari

ciclo	ldr	r2,r0,#0	;metto in r1 il primo valore di r0
	add	r5,r0,r1
	brp	fine
sottr	add	r2,r2,#-2
	brp	sottr
	brn	dispari
	brz	pari

veri	add	r5,r0,r1
	brp	fine
	brnz	incr

incr 	add	r0,r0,#1
	brnzp	ciclo

dispari	add	r3,r3,#1
	brnzp	veri

pari	add	r4,r4,#1
	brnzp	veri

fine	and	r0,r0,#0
	and	r1,r1,#0
	add	r0,r4,r0
	add	r1,r1,r3
	ld	r2,salvar2
	ld	r3,salvar3
	ld	r4,salvar4
	ld	r5,salvar5
	ret


;variabili sottoprogramma
salvar2	.blkw	1
salvar3	.blkw	1	
salvar4	.blkw	1
salvar5	.blkw	1
	.end