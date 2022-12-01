;istruzioni programma principale
	.orig	x3000
	lea	r0,string
	jsr	subpr


;variabili programma principale
string  .stringz "Buon Lunedi 26 novembre 2018"


;istruzioni sottoprogramma

subpr	st	r1,salvar1
	st	r2,salvar2
	st	r3,salvar3
	st	r4,salvar4
	st	r5,salvar5
	st	r6,salvar6
	
	ld 	r4,z		;carico z in r4
	ld	r5,a		;carico a in r5
	ld	r6,Maiusc	;carico il valore per trasformare da minuscolo in maiuscolo
	and 	r3,r3,#0	;la userò come somme ecc...
	and 	r2,r2,#0	;sarà il mio contatore di minuscole
ciclo	ldr	r1,r0,#0	;carico in r1 il primo carattere di str
	brz	fine
	add	r3,r4,r1	;sottraggo a -122 il carattere
	brnz	neg_nul		;se il risultato è negativo o nullo allora il carattere è più piccolo di 122
	brp	no		;se il risultato è positivo vuol dire che il carattere è maggiore di 122 e quindi non è un carattere minuscolo
	
neg_nul	add	r3,r5,r1	;sottraggo a -97 il carattere
	brzp	min		;se il risultato è positivo o nullo allora il carattere è maggiore di 97
	brn	no		;se il risultato p negativo vuol dire che è piu piccolo di 97 e quindi non è un carattere minuscolo


min	add	r1,r1,r6
	str	r1,r0,#0	;per scrivere sulla stringa il nuovo valore di r1
	add	r2,r2,#1
	brnzp	ciclo
no	add	r0,r0,#1	;scorro al prossimo carattere
	brnzp	ciclo

fine	and	r0,r0,#0
	add	r0,r1,r0
	ld	r1,salvar1
	ld	r2,salvar2
	ld	r3,salvar3
	ld	r4,salvar4
	ld	r5,salvar5
	ld	r6,salvar6
	
	ret


;variabili sottoprogramma

salvar1	.blkw	1	
salvar2	.blkw	1
salvar3	.blkw	1	
salvar4	.blkw	1
salvar5	.blkw	1
salvar6 .blkw	1
z	.fill	-122
a	.fill	-97
Maiusc	.fill	-32
	.end