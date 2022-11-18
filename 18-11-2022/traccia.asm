	.orig	x3000

;qui istruzioni assembly del programma principale

;qui costanti e variabili del programma principale (non devono essere toccate dal fetch della cpu)
label1	.blkw	10	;riserva 10 celle in memoria a partire dall'indirizzo label1
label2	.fill	10	;inizializzza Una cella di indirizo label2 al valore 10
label3  .stringz "Frase";riserva le celle necessarie per codificare ASCII i caratteri di Frase più una finale con valore 0

;************************************************ (consegnare da qui :) )
;qui inizia il sottoprogramma - istruzioni assembly del sottoprogramma
subpr	...
	...
	...

	ret 

;qui costanti e variabili del sottoprogramma (non devono essere toccate dal fetch della cpu)
	.blkw
	.fill
	.stringz

;*********************************************** (a qui :) )




	.end



	