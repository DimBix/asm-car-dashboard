/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo

*/

.section .data

num_str_ind:

    .long 00000000000

num_ind:

    .long 00000000000

.section .text

    .global str_to_int_funz

    .type str_to_int_funz, @function

str_to_int_funz:

    movl %eax, num_str_ind
    movl %ebx, num_ind

    xorl %eax, %eax
    xorl %edx, %edx

    movl num_str_ind, %esi
    movl $0, %ecx
    movl $0, %ebx

ripeti:

    movb (%ecx,%esi,1), %bl

    cmpb $10, %bl
    je fine

    subb $48, %bl
    movl $10, %edx
    mulb %dl
    addl %ebx, %eax

    incl %ecx
    jmp ripeti

    fine:
        
    movl num_ind, %ebx

    movl %eax, (%ebx)

    ret
        