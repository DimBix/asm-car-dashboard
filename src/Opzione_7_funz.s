/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 7 del menù

*/

.section .data

    scelta_freccia:

        .ascii "000"

    code:
        .long 00000000000
    
    blocco_porte:

        .long 00000000000

    back_home:

        .long 00000000000

    num_lamp:

        .long 00000000000
        
    num_lamp_str:

        .ascii "0000"

    num_lamp_str_lung:

        .long 0

    num_lamp_str_scelta:

        .ascii "00000000"

    num_lamp_str_scelta_lung:

        .long . - num_lamp_str_scelta

    numero:
        .long 0

    contatore:
        .long 0

.section .text

    .global Opzione_7_funz

    .type Opzione_7_funz, @function

Opzione_7_funz:

    movl %eax, code

    movl %ebx, blocco_porte

    movl %ecx, back_home

    movl %edx, num_lamp

    loop_richiesta:

        call Opzione_7_testo_funz
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

            je link_funz_prec

            cmpb $67, %dl

            je link_menu

            jne loop_richiesta

        link_funz_prec:

            movl back_home, %ecx

            call Opzione_6_funz

            jmp loop_richiesta

        continua_analisi:

	        incl %ecx

	        jmp ripeti

        link_menu_pulizia:

            call pulizia

        link_menu:

            movl $0, contatore

            movl $0, numero

            call Opzione_7_testo_alternativa_funz

            movl num_lamp, %eax
            movl $num_lamp_str, %ebx
            movl $num_lamp_str_lung, %ecx

            call int_to_str_funz                    #converte l'intero (num lampeggi) in stringa per la stampa

            movl $4, %eax
            movl $1, %ebx
            leal num_lamp_str, %ecx
            movl num_lamp_str_lung, %edx
            int $0x80

            call Tab_funz
            call punt

            movl $3, %eax
            movl $1, %ebx
            leal num_lamp_str_scelta, %ecx
            movl num_lamp_str_scelta_lung, %edx
            int $0x80

            leal num_lamp_str_scelta, %esi

            xorl %ecx, %ecx

            movb (%ecx, %esi, 1), %dl

            cmpb $10, %dl

            je loop_richiesta

            leal num_lamp_str_scelta, %eax

            movl num_lamp, %ebx

            call str_to_int_funz

            controllo_validita_valori:

                movl num_lamp, %eax

                cmpl $5, (%eax)

                jg greater

                cmpl $2, (%eax)

                jl less

                jmp loop_richiesta

            less:

                movl $2, (%eax)

                jmp loop_richiesta

            greater:

                movl $5, (%eax)

                jmp loop_richiesta

        fine:

    movl back_home, %ecx

    movl num_lamp, %edx

    ret
