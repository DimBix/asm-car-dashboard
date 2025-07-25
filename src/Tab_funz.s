/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video una tabulazione

    Note ulteriori: il commento sarà assente per funzioni così basilari
*/
 
.section .data

Tab:

    .ascii "\t"

Tab_lung:

    .long . - Tab

.section .text

    .global Tab_funz

    .type Tab_funz, @function

Tab_funz:

    movl $4, %eax
    movl $1, %ebx
    leal Tab, %ecx
    movl Tab_lung, %edx
    int $0x80

    ret
    