/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un :

        
*/
 
.section .data

punt_testo:

    .ascii ":"

punt_testo_lung:

    .long . - punt_testo

.section .text

    .global punt

    .type punt, @function

punt:

    movl $4, %eax
    movl $1, %ebx
    leal punt_testo, %ecx
    movl punt_testo_lung, %edx
    int $0x80

    ret
    
