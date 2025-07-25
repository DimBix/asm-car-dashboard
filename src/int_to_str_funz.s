/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Conversione intero in stringa

*/

.section .data

    numtmp:

        .ascii "00000"

    num_str_ind:

        .long 0000000000

    num_str_lung_ind:

        .long 0000000000

.section .text

    .global int_to_str_funz

    .type int_to_str_funz, @function

int_to_str_funz:

    movl (%eax), %eax
    movl %ebx, num_str_ind
    movl %ecx, num_str_lung_ind

	movl $10, %ebx             
	movl $0, %ecx              

	leal numtmp, %esi          

continua_a_dividere:

	movl $0, %edx              
	divl %ebx                  

	addb $48, %dl              
	movb %dl, (%ecx,%esi,1)    

	incl %ecx                   

	cmpl $0, %eax               

	jne continua_a_dividere

	movl $0, %ebx              

    movl num_str_ind, %edx     
                                 
ribalta:

	movb -1(%ecx,%esi,1), %al  
	movb %al, (%ebx,%edx,1)    

	incl %ebx                   

	loop ribalta

    movl num_str_lung_ind, %edx

    movl %ebx, (%edx)

    ret
