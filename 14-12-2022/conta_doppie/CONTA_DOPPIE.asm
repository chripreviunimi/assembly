;programma principale
	.orig	x3000
	lea	r0,string
	lea	r1,fine_string
	add	r1,r1,#-2	;ora r1 punta all'ultima cella di string

	jsr 	CONTA_DOPPIE

stop	brnzp	stop




;variabili programma principale

string	.stringz	"nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che' la diritta via era smarrita"													;														
fine_string	.fill	#0



;sottoprogramma
CONTA_DOPPIE
		not	r1,r1
	add	r1,r1,#1	;nego r1 per vedere se sono arrivato alla fine
	
	st	r2,salvar2	;lettera puntata
	st	r3,salvar3	;lettere puntata+1
	st	r4,salvar4	;contatore delle doppie
	st	r5,salvar5	;somma dei registri

	and	r2,r2,#0
	and	r3,r3,#0
	and	r4,r4,#0
	and	r5,r5,#0

ciclo	add	r5,r1,r0
	brz	fine
	ldr	r2,r0,#0	;a(i)
	add	r0,r0,#1
	ldr	r3,r0,#0	;a(i+1)	
	not	r3,r3		;a(i+1)
	add	r3,r3,#1	;nego a(+1) cosi da poterlo comparare
	add	r3,r2,r3
	brz	conta
	brnp	ciclo

conta	add	r4,r4,#1
	brnzp	ciclo

fine	and	r0,r0,#0
	add	r0,r4,r0
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