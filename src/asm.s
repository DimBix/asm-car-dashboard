/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Main
    
    Note ulteriori: saranno presenti alcuni "nop" per fornire una visione migliore del codice commentato

*/

.section .data

    code:
        .long 0000                  #codice accensione macchina (con 2244 si accede alla mod supervisor)

    blocco_porte:
        .long 00                    #variabile per tenere sotto controllo lo stato delle porte 0 equivale a ON e 1 ad OFF

    back_home:
        .long 00                    #variabile per l'opzione back-home. 0 equivale a ON e 1 ad OFF

    num_lamp:
        .long 0000                  #numero lampeggi delle frecce, di default è 3

.section .text

    .global _start

_start:

    movl $3, num_lamp               #imposto i lampeggi delle frecce a 3

    acquisizione_parametri:

        movl $0, code               #resetto code
        
        movl %esp, %eax             #muovo l'indirizzo della cima dello stack in EAX

        movl (%eax), %ebx           #copio il contenuto dell'indirizzo contenuto dentro la cima dello stack in EBX

        cmpl $1, %ebx               #in cima allo stack è presente il numero di parametri, con cui è stato avviato 
        nop                         #il programma, quindi controllo se tale numero è maggiore di uno

        je no_parametri             #se c'è un solo parametro (ossia il nome del programma) salto

        addl $8, %eax               #nel caso ce ne siano altri, aggiungo 8 all'indirizzo, così scendo di due poszioni
        nop                         #nella stack e mi posiziono nella cella dove è contenuto l'indirizzo al secondo parametro

        movl (%eax), %eax           #copio questo indirizzo in EAX 

        movl %eax, %esi             #

        movl $4, %ecx               #

        movl $10, (%ecx, %esi, 1)   #aggiungo un \n in fondo alla stringa, "2244\n"

        movl $code, %ebx            #

        call str_to_int_funz        #converto la stringa in numero, che verrà messo direttamente in code

    movl $code, %eax                #copio l'indirizzo di code in EAX, che userò in tutte le funzioni successive

    no_parametri:                   #nel caso non ci siano parametri (oltre al nome del programma) salto qua

    call Opzione_1_funz             #

    call Opzione_2_funz             #  

    call Opzione_3_funz             #

    movl $blocco_porte, %ebx        #copio l'indirizzo di blocco porte in EBX perchè questa funzione ha bisogno 
    nop                             #di stampare a video lo stato della variabile Blocco porte

    call Opzione_4_funz             #

    movl $back_home, %ecx           #copio l'indirizzo in ECX per motivi simili ai precedenti

    call Opzione_5_funz             #

    call Opzione_6_funz             #

    cmpl $2244, (%eax)                #confronto se il codice è uguale a quello del supervisor

    jne no_parametri                #se non è uguale salto all'inzio del programma

    movl $num_lamp, %edx            #

    call Opzione_7_funz             #

    call Opzione_8_funz             #
    
    movl $1, %edx                   #creazione ciclo infinito come richiesto da consegna
    
    cmpl $1, %edx
    
    je no_parametri

    fine:                           #

    movl $1, %eax                   #
	movl $0, %ebx                   #
	int $0x80                       #termino il programma, anche se non si giugerà mai qua
    
