/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo


*/

.section .data

Opzione_7_testo_alternativa:

    .ascii "\nNumero lampeggi modalità autostrada: "

Opzione_7_testo_altenrativa_lung:

    .long . - Opzione_7_testo_alternativa

.section .text

    .global Opzione_7_testo_alternativa_funz

    .type Opzione_7_testo_alternativa_funz, @function

Opzione_7_testo_alternativa_funz:
 
    movl $4, %eax
    movl $1, %ebx
    leal Opzione_7_testo_alternativa, %ecx
    movl Opzione_7_testo_altenrativa_lung, %edx
    int $0x80

    ret
    
