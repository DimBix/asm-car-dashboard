/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo


*/

.section .data

Opzione_3_testo:

    .ascii "\nOra: 03:14\t\t\t\t:"

Opzione_3_testo_lung:

    .long . - Opzione_3_testo

.section .text

    .global Opzione_3_testo_funz

    .type Opzione_3_testo_funz, @function

Opzione_3_testo_funz:
 
    movl $4, %eax
    movl $1, %ebx
    leal Opzione_3_testo, %ecx
    movl Opzione_3_testo_lung, %edx
    int $0x80

    ret
    
