/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 2 del menù

    Note ulteriori:     Le funzioni svolte sono quasi identiche alla funzione 1, si veda quella per i commenti
*/

.section .data

    scelta_freccia:

        .ascii "00000"

    code:
        .long 00000000000

.section .text

    .global Opzione_2_funz

    .type Opzione_2_funz, @function

Opzione_2_funz:

    movl %eax, code

    loop_richiesta:

        call Opzione_2_testo_funz

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

            cmpb $65, %bl              #nel caso sia freccia-su si ritorna alla funzione precedente

            jne loop_richiesta

            je link_funz_prec

        link_funz_prec:

            call Opzione_1_funz

            jmp loop_richiesta

        continua_analisi:

            incl %ecx

            jmp ripeti

        fine:

    ret
