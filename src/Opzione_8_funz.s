/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 8 del menù

*/

.section .data

    scelta_freccia:

        .ascii "00000"

    scelta_freccia_2:

        .ascii "00000"

    code:

        .long 00000000000
    
    blocco_porte:

        .long 00000000000

    back_home:

        .long 00000000000
    
    num_lamp:

        .long 00000000000

    counter:
        .byte 0

.section .text

    .global Opzione_8_funz

    .type Opzione_8_funz, @function

Opzione_8_funz:

    movl %eax, code

    movl %ebx, blocco_porte

    movl %ecx, back_home

    movl %edx, num_lamp

    loop_richiesta:

        call Opzione_8_testo_funz
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

            movl blocco_porte, %ebx

            movl back_home, %ecx

            movl num_lamp, %edx

            call Opzione_7_funz

            jmp loop_richiesta

        continua_analisi:

	        incl %ecx

	        jmp ripeti

        link_menu_pulizia:

            call pulizia


        link_menu:

            movb $0, counter

            call Opzione_8_testo_menu_funz
            call Tab_funz
            call punt

            movl $3, %eax
            movl $1, %ebx
            leal scelta_freccia_2, %ecx
            movl $1, %edx
            int $0x80

            xorl %ecx, %ecx

            leal scelta_freccia_2, %esi

            movb (%esi), %bl

            cmpb $10, %bl

            je loop_richiesta

            jne car_1_b
        
            ripeti_2:

                movl $3, %eax
                movl $1, %ebx
                leal scelta_freccia_2, %ecx
                movl $1, %edx
                int $0x80

                movb counter, %cl

                movb (%esi), %bl

                cmpb $1, %cl

                je car_2_b
                
                cmpb $2, %cl

                je  car_3_b

            car_1_b:
            
                cmpb $27, %bl

                je continua_analisi_2

                jne link_menu_pulizia

            car_2_b:

                cmpb $91, %bl

                jne link_menu_pulizia

                je continua_analisi_2

            car_3_b:

                cmpb $67, %bl

                je reset

                jne link_menu_pulizia

            continua_analisi_2:

                incb %cl

                movb %cl, counter

                jmp ripeti_2
            
            reset:

                call pulizia
                call Opzione_8_testo_alternativa_funz
                call Tab_funz
                call Tab_funz
                call punt
                call New_line_funz

                jmp loop_richiesta

        fine:

    ret
