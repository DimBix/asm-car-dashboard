/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 6 del menù

*/

.section .data

    scelta_freccia:

        .ascii "00000"

    code:

        .long 0000000000

    blocco_porte:

        .long 0000000000

    back_home:

        .long 0000000000

.section .text

    .global Opzione_6_funz

    .type Opzione_6_funz, @function

Opzione_6_funz:

    movl %eax, code

    movl %ebx, blocco_porte

    movl %ecx, back_home

    loop_richiesta:

        call Opzione_6_testo_funz
        call Tab_funz
        call Tab_funz
        call Tab_funz
        call Tab_funz
        call punt

        movl $3, %eax
        movl $1, %ebx
        leal scelta_freccia, %ecx
        movl $3, %edx
        int $0x80

        call pulizia

        movl code, %eax

        movl blocco_porte, %ebx

        xorl %ecx, %ecx

        leal scelta_freccia, %esi
	
        ripeti:

            movb (%ecx, %esi, 1), %dl
        
            cmpl $0, %ecx

            je car_1

            cmpl $1, %ecx

            je car_2

            cmpl $2, %ecx

            je  car_3

            car_1:
            
                cmpb $27, %dl

                jne loop_richiesta

                je continua_analisi

            car_2:

                cmpb $91, %dl

                jne loop_richiesta

                je continua_analisi

            car_3:

                cmpb $66, %dl

                je fine

                cmpb $65, %dl

                jne loop_richiesta

                je link_funz_prec

            link_funz_prec:

                movl back_home, %ecx

                call Opzione_5_funz

                jmp loop_richiesta

            continua_analisi:

                incl %ecx

                jmp ripeti

        fine:

        movl back_home, %ecx

    ret
