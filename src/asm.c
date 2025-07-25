#include <stdio.h>
#include <stdlib.h>
#define SIZE 4
#define N 2

void opzione_1(int);
void opzione_2(int);
void opzione_3(int);
void opzione_4(int, int *);
void opzione_5(int, int *);
void opzione_6(int, int *);
int opzione_7(int, int, int *);
int opzione_8(int, int, int *);

int main(int argc, char *argv[]) {
    int i = 1;
    int code;
    int num_lamp = 3;
    int blocco[N];

    blocco[0] = 0;		//blocco automatico porte off (0 = on)
    blocco[1] = 0;		//back home off (0 = on)

    if (argc > 1) {
        char *a = argv[1];	//acquisizione parametro attivazione programma
        code = atoi(a);
    } else {
        code = 0;
    }

    do {
        opzione_1(code);
        opzione_2(code);
        opzione_3(code);
        opzione_4(code, blocco);
        opzione_5(code, blocco);
        opzione_6(code, blocco);
        
        if (code == 2244) {
            num_lamp = opzione_7(code, num_lamp, blocco);
            num_lamp = opzione_8(code, num_lamp, blocco);
        }
    } while (i > 0);

    return (0);
}

void opzione_1(int code) {
    char scelta[SIZE];
    char ch;

    do {
        if (code != 2244) {
            printf("\nSetting automobile:\t\t\t\t:");
        } else {
            printf("\nSetting automobile (supervisor):\t\t:");
        }
        fgets(scelta, SIZE, stdin);

        while ((ch = getchar()) != '\n');	//eliminazione eventuali caratteri aggiuntivi

    } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66); 
}

void opzione_2(int code) {
    char scelta[SIZE];
    char ch;

        do {
            printf("\nData: 21/03/2023\t\t\t\t:");

            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 65) {
                opzione_1(code);
            }
        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);
}

void opzione_3(int code) {
    char scelta[SIZE];
    char ch;

        do {
            printf("\nOra: 03:14\t\t\t\t\t:");
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 65) {
                opzione_2(code);
            }
        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);
}

void opzione_4(int code, int blocco[]) {
    char scelta[SIZE];
    char scelta2[SIZE];
    char ch;


        do {
            if (blocco[0] == 0) {
                printf("\nBlocco automatico porte: ON\t\t\t:");
            } else {
                printf("\nBlocco automatico porte: OFF\t\t\t:");
            }
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 67) {
                printf("\nBlocco automatico porte:\t\t\t:");

                ch = getchar();

                if (ch != 10) {
                    scelta2[0] = ch;
                    scelta2[1] = getchar();
                    scelta2[2] = getchar();

                    while ((ch = getchar()) != '\n');

                    if (scelta2[0] == 27 && scelta2[1] == 91 && scelta2[2] == 65 ) {
                        blocco[0] = 0;
                    } else if (scelta2[0] == 27 && scelta2[1] == 91 && scelta2[2] == 66) {
                        blocco[0] = 1;
                    }
                }
            } else if (scelta[0] == 27 && scelta[1] == 91 &&scelta[2] == 65) {
                opzione_3(code);
            }

        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);
}

void opzione_5(int code, int blocco[]) {
    char scelta[SIZE];
    char scelta2[SIZE];
    char ch;

        do {
            if (blocco[1] == 0) {
                printf("\nBack-home: ON\t\t\t\t\t:");
            } else {
                printf("\nBack-home: OFF\t\t\t\t\t:");
            }
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 67) {
                printf("\nBack-home:\t\t\t\t\t:");

                ch = getchar();
                
                if (ch != 10) {
                    scelta2[0] = ch;
                    scelta2[1] = getchar();
                    scelta2[2] = getchar();

                    while ((ch = getchar()) != '\n');

                    if (scelta2[0] == 27 && scelta2[1] == 91 && scelta2[2] == 65 ) {
                        blocco[1] = 0;
                    } else if (scelta2[0] == 27 && scelta2[1] == 91 && scelta2[2] == 66) {
                        blocco[1] = 1;
                    }
                }
            } else if (scelta[0] == 27 && scelta[1] == 91 &&scelta[2] == 65) {
                opzione_4(code, blocco);
            }

        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);
}

void opzione_6(int code, int blocco[]) {
    char scelta[SIZE];
    char ch;

        do {
            printf("\nCheck olio\t\t\t\t\t:");
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 &&scelta[2] == 65) {
                opzione_5(code, blocco);
            }
        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);
}

int opzione_7(int code, int num_lamp, int blocco[]) {
    char scelta[SIZE];
    char num_car;
    char ch;


        do {
            printf("\nFrecce direzione\t\t\t\t:");
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 67) {
                printf("\nNumero lampeggi modalità autostrada: %d\t\t:", num_lamp);
                num_car = (int)getchar();

                if (num_car != 10) {
                
                	while ((ch = getchar()) != '\n');

                    if(num_car >= 48 && num_car <= 57) {
                        num_lamp = num_car - 48;
            
                        if(num_lamp > 5) {
                            num_lamp = 5;
                        } else if (num_lamp < 2) {
                            num_lamp = 2;
                        }
                    }
                }
            } else if (scelta[0] == 27 && scelta[1] == 91 &&scelta[2] == 65) {
                opzione_6(code, blocco);
            }

        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);

    return (num_lamp);
}

int opzione_8(int code, int num_lamp, int blocco[]) {
    char scelta[SIZE];
    char scelta2[SIZE];
    char ch;

        do {
            printf("\nReset pressione gomme\t\t\t\t:");
            fgets(scelta, SIZE, stdin);

            while ((ch = getchar()) != '\n');

            if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 67) {
                printf("\nReset pressione gomme (sotto-menù)\t\t:");

                ch = getchar();
                if(ch != 10) {
                    scelta2[0] = ch;
                    scelta2[1] = getchar();
                    scelta2[2] = getchar();

                    while ((ch = getchar()) != '\n');

                    if (scelta2[0] == 27 && scelta2[1] == 91 && scelta2[2] == 67) {
                        printf("\nPressione gomme resettata\t\t\t:\n");
                    }
                }
            } else if (scelta[0] == 27 && scelta[1] == 91 && scelta[2] == 65) {
                num_lamp = opzione_7(code, num_lamp, blocco);
            }

        } while (scelta[0] != 27 || scelta[1] != 91 || scelta[2] != 66);

    return (num_lamp);
}
