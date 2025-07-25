/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo


*/

.section .data

Opzione_5_testo:

    .ascii "\nBack-home: "

Opzione_5_testo_lung:

    .long . - Opzione_5_testo

.section .text

    .global Opzione_5_testo_funz

    .type Opzione_5_testo_funz, @function

Opzione_5_testo_funz:
 
    movl $4, %eax
    movl $1, %ebx
    leal Opzione_5_testo, %ecx
    movl Opzione_5_testo_lung, %edx
    int $0x80

    ret
    
