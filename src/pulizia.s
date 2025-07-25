/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per eliminare eventuali input

    Note ulteriori:     /
*/

.section .data

    car:
        .ascii "0" 

.section .text

    .global pulizia

    .type pulizia, @function

pulizia:                            #prendo  1 carattere per volta

    movl $3, %eax
    movl $1, %ebx
    leal car, %ecx
    movl $1, %edx
    int $0x80

    leal car, %esi

    movb (%esi), %bl

    cmpb $10, %bl                   #controllo sia \n, se lo è ho finito e continuo, altrimenti ritorno a pulizia e continuo a consumare eventualia altri input

    jne pulizia

    ret
