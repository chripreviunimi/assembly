;programma principale
	.orig	x3000
	lea	r0,num
	jsr	subpr		


;variabili programma principale

num	.fill	-9

;sottoprogramma
subpr	ldr	r2,r0,#0	;salvo in r2 il contenuto all'indirizzo di r0
	and	r2,r2,r2
	brn	conv		;se è negativo devo andare a convertirlo
	ret			;se è positivo non devo fare niente


conv	st	r1,salvar1	;uso r1 come maschera per cambiare tutti i bit tranne quello piu significativo
	st	r2,salvar2
	ld	r1,mask
	and	r2,r2,r1	;cambio i bit
	not	r2,r2		
	add	r2,r2,r1	;li nego
	ld	r1,salvar1
	and	r0,r0,#0
	add	r0,r2,r0
	ld	r2,salvar2
	ret

;variabili sottoprogramma

mask	.fill	b0111111111111111
salvar1	.blkw	1
salvar2	.blkw	1

	.end