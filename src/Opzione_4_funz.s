/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 4 del menù

*/

.section .data

    on_testo:

        .ascii "ON "

    on_testo_lung:

        .long . - on_testo

    off_testo:

        .ascii "OFF"

    off_testo_lung:

        .long . - off_testo

    scelta_freccia:

        .ascii "00000"

    scelta_freccia_2:

        .ascii "00000"

    code:

        .long 00000000000
    
    blocco_porte:

        .long 00000000000

    counter:
        .byte 0

.section .text

    .global Opzione_4_funz

    .type Opzione_4_funz, @function

Opzione_4_funz:

    movl %eax, code

    movl %ebx, blocco_porte

    loop_richiesta:

        call Opzione_4_testo_funz

        movl blocco_porte, %eax             #sposto l'ind di blocco_porte in EAX

        movl (%eax), %ebx                   #sposto il contenuto dell'ind di blocco_porte in EBX

        cmpl $1, %ebx                        #controllo se è 1 (ON = 0, OFF = 1)

        je OFF                              #se è 1 salto all'etichetta OFF

        ON:

            movl $4, %eax
            movl $1, %ebx
            leal on_testo, %ecx
            movl on_testo_lung, %edx
            int $0x80

            jmp continue

        OFF:

            movl $4, %eax
            movl $1, %ebx
            leal off_testo, %ecx
            movl off_testo_lung, %edx
            int $0x80

        continue:

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

	        movb (%ecx, %esi, 1), %bl
	
	        cmpl $0, %ecx

            je car_1

            cmpl $1, %ecx

            je car_2

            cmpl $2, %ecx

            je  car_3

        car_1:
        
            cmpb $27, %bl

            jne loop_richiesta

            je continua_analisi

        car_2:

            cmpb $91, %bl

            jne loop_richiesta

            je continua_analisi

        car_3:

            cmpb $66, %bl

            je fine

            cmpb $65, %bl

            je link_funz_prec

            cmpb $67, %bl               #se la scelta dell'utente è (freccia-destra 27 91 67)

            je link_menu                #entro nel sotto-menu

            jne loop_richiesta

        link_funz_prec:

            movl code, %eax

            call Opzione_3_funz

            jmp loop_richiesta

        continua_analisi:

	        incl %ecx

	        jmp ripeti

        link_menu_pulizia:

            call pulizia

        link_menu:

            movb $0, counter

            call Opzione_4_testo_funz
            call Tab_funz
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

                cmpb $65, %bl                #se la scelta è freccia su

                je ON_2                     #salto all'etichetta ON_2 dove setterò ad 0 blocco porte (ossia ON)

                cmpb $66, %bl                #se la scelta è freccia giù

                jne link_menu_pulizia               

                je OFF_2                    #salterò ad OFF_2 dove imposterò blocco porte a 1 (ossia OFF)

            continua_analisi_2:

                incb %cl

                movb %cl, counter

                jmp ripeti_2
            
            OFF_2:
                
                call pulizia

                movl blocco_porte, %ebx

                movl $1, (%ebx)

                jmp loop_richiesta
    
            ON_2:

                call pulizia

                movl blocco_porte, %ebx

                movl $0, (%ebx)

                jmp loop_richiesta

        fine:

    movl blocco_porte, %ebx                     #code è già dentro il registro EAX, si veda riga 105

    ret
