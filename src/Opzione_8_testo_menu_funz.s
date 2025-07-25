/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo


*/

.section .data

Opzione_8_testo_menu:

    .ascii "\nReset pressione Gomme (sottomenu):"

Opzione_8_testo_menu_lung:

    .long . - Opzione_8_testo_menu

.section .text

    .global Opzione_8_testo_menu_funz

    .type Opzione_8_testo_menu_funz, @function

Opzione_8_testo_menu_funz:
 
    movl $4, %eax
    movl $1, %ebx
    leal Opzione_8_testo_menu, %ecx
    movl Opzione_8_testo_menu_lung, %edx
    int $0x80

    ret
    