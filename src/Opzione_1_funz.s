/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione per opzione 1 del menù

    Note ulteriori:     /
*/

.section .data

    scelta_freccia:

        .ascii "000"                  #variabile per la scelta dell'utente (freccia su/giù/destra)
        
    code:
        .long 0000000000000

.section .text

    .global Opzione_1_funz

    .type Opzione_1_funz, @function

Opzione_1_funz:


    loop_richiesta:

        movl %eax, code                     #copio l'indirizzo passatomi dal main in code

        call Opzione_1_testo_funz           #stampo a video il messaggio
        call Tab_funz
        call punt

        movl $3, %eax
        movl $1, %ebx
        leal scelta_freccia, %ecx
        movl $3, %edx                       #prendo solo 3 caratteri, ossia quelli necessari per la freccia
        int $0x80

        call pulizia

        movl code, %eax                     #copio nuovamente l'indirizzo in EAX per l'eventuale riesecuzione della funzione

        xorl %ecx, %ecx                     #

        leal scelta_freccia, %esi           #   
	
        ripeti:

            movb (%ecx, %esi, 1), %bl       #analizzo carattere per carattere la stringa scelta_freccia
            
            cmpl $0, %ecx                   #nel caso sia la prima analisi

            je car_1                        #salto a car_1, dove mi assicurerò che coincida con il carattere 27

            cmpl $1, %ecx                   #nel casio sia la seconda

            je car_2                        #

            cmpl $2, %ecx                   #nel caso sia la terza (P.S. freccia destra si traduce in 27/91/67, 
            nop                             #quindi qualsiasi carattere oltre la terza posizione o è un 
            nop                             #terminatore/new line, o è un errore, quindi li ignorerò)

            je  car_3

        car_1:
        
            cmpb $27, %bl

            jne loop_richiesta              #nel caso il primo carattere sia diverso dall'attesa, ripeto il loop_richiesta

            je continua_analisi             #nel caso invece sia corretto, continuo l'analisi della stringa

        car_2:

            cmpb $91, %bl

            jne loop_richiesta

            je continua_analisi

        car_3:

            cmpb $66, %bl

            jne loop_richiesta

            je fine                         #nel caso anche il terzo carattere sia corretto (freccia giù = 27 91 66)
            nop                             #salto alla fine della funzione
        continua_analisi:

            incl %ecx                       #incremento il contatore e ripeto

            jmp ripeti

        fine:

    ret
