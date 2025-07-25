/*
    Tipologia:  Elaborato
    
    Data:       27/04/2023
    
    Comanda:    Stampare a video il menù delle impostazioni del cruscotto di un'automobile

    Note:       Funzione atta a stampare a video un Testo
    
    		Bisogna inserire nel registro EAX il valore dell'eventuale parametro acquisito
    		da tastiera, nel caso di assenza di quest'ultimo basterà inserire il valore 0

*/
 
.section .data

    Opzione_1_testo:

        .ascii "\nSetting automobile:\t\t"

    Opzione_1_testo_lung:

        .long . - Opzione_1_testo

    Opzione_1_testo_alternativa:

        .ascii "\nSetting automobile (supervisor):"

    Opzione_1_testo_alternativa_lung:

        .long . - Opzione_1_testo_alternativa

.section .text

    .global Opzione_1_testo_funz

    .type Opzione_1_testo_funz, @function


Opzione_1_testo_funz:

    cmpl $2244, (%eax)                 #Il parametro o codice di attivazione si troverà in EAX

    je supervisor

    movl $4, %eax
    movl $1, %ebx
    leal Opzione_1_testo, %ecx
    movl Opzione_1_testo_lung, %edx
    int $0x80

    jmp fine

    supervisor:

    movl $4, %eax
    movl $1, %ebx
    leal Opzione_1_testo_alternativa, %ecx
    movl Opzione_1_testo_alternativa_lung, %edx
    int $0x80

    fine:

    ret
