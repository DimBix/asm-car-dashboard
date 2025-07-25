/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un new line


*/
 
.section .data

New_line:

    .ascii "\n"

New_line_lung:

    .long . - New_line

.section .text

    .global New_line_funz

    .type New_line_funz, @function

New_line_funz:

    movl $4, %eax
    movl $1, %ebx
    leal New_line, %ecx
    movl New_line_lung, %edx
    int $0x80

    ret
    