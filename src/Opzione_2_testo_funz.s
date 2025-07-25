/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video il testo inerente all'Opzione 2 del menu

    Note ulteriori:

*/
 
.section .data

    Opzione_2_testo:

        .ascii "\nData: 27/04/2023\t\t\t:"

    Opzione_2_testo_lung:

        .long . - Opzione_2_testo

.section .text

    .global Opzione_2_testo_funz

    .type Opzione_2_testo_funz, @function

Opzione_2_testo_funz:

    movl $4, %eax
    movl $1, %ebx
    leal Opzione_2_testo, %ecx
    movl Opzione_2_testo_lung, %edx
    int $0x80

    ret
    
