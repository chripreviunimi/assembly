;istruzioni programma principale
	.orig	x3000
	lea	r0,array
	jsr 	GAP_ASS

stop	brnzp	stop

;variabili programma principale

array	.fill	112
	.fill	-27
	.fill	-12
	.fill	45
	.fill	15
	.fill	0

;istruzioni sottoprogramma
GAP_ASS	st	r1,salvar1	;dove salvo il numero a(i)
	st	r2,salvar2	;dove salvo il massimo
	st	r3,salvar3	;dove salvo il minimo
	ldr	r1,r0,#0
	and	r2,r2,#0
	and	r3,r3,#0
	add	r2,r1,r2	;metto il primo numero come massimo
	add	r3,r1,r3	;metto il primo numero come minimo
	add	r0,r0,#1

ciclo	add	r0,r0,#1
	ldr	r1,r0,#0
	brz	fine
	brn	mod
go	not	r1,r1
	add	r1,r1,#1
	add	r2,r1,r2	;faccio la sottrazione tra il numero che ho appena salvato e il mio massimo, se è negativo vuol dire che il numero appena salvato è piu grande
	brn	cambiomax
	not	r1,r1
	add	r1,r1,#1
	add	r2,r1,r2	;rimetto in r2 il numero di prima
	
	not	r1,r1
	add	r1,r1,#1
	add	r3,r1,r3	;faccio la sottrazione tra il numero che ho appena salvato e il mio minimo, se è positivo vuol dire che il numero appena salvato è piu piccolo
	brp	cambiomin
	not	r1,r1
	add	r1,r1,#1
	add	r3,r1,r3	;rimetto in r3 il numero di prima	
	brnzp	ciclo
	
cambiomax	and	r2,r2,#0
		not	r1,r1
		add	r1,r1,#1
		add	r2,r1,#0
		brnzp	ciclo

cambiomin	and	r3,r3,#0
		not	r1,r1
		add	r1,r1,#1
		add	r3,r1,#0
		brnzp	ciclo


mod	not	r1,r1
	add	r1,r1,#1	;lo converto positivo tanto mi serve il val assoluto
	brnzp	go



fine	not	r3,r3
	add	r3,r3,#1
	and	r0,r0,#0
	add	r0,r2,r3
	ld	r1,salvar1
	ld	r2,salvar2
	ld	r3,salvar3
	ret	

;variabili sottoprogramma
salvar1	.blkw	1
salvar2	.blkw	1	
salvar3	.blkw	1
	.end