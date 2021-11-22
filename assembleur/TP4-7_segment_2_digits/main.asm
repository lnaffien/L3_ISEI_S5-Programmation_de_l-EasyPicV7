#include <PIGF877A.inc>
__CONFIG _HS_OSC & _WOT_OFF & _LVP_OFF      
CBLOCK 0x20 ;Reserver une zone de variable 
    Valeur_tempo : 2
    Valeur_digit_1 : 1
    ENDC
org 0x0000
goto main

main :
    ;Initialisation
    BSF STATUS, RP0 ;Aller a la page memoire 1
    BCF STATUS, RP1
    BCF TRISA, 0    ;PORTA PIN0 = sortie
    BCF TRISD, 0    ;PORTD = sortie
    BCF TRISD, 1
    BCF TRISD, 2
    BCF TRISD, 3
    BCF TRISD, 4
    BCF TRISD, 5
    BCF TRISD, 6
    BCF TRISD, 7
    BCF STATUS, RP0 ;Retour a la page memoire 0
    GOTO afficher1 ;Test de l'initialisation et de la syntaxe pour l'affichage
boucle_digit0 :
    CALL afficher0
    CALL tempo
    CALL afficher1
    CALL tempo
    CALL afficher2
    CALL tempo
    CALL afficher3
    CALL tempo
    CALL afficher4
    CALL tempo
    CALL afficher5
    CALL tempo
    CALL afficher6
    CALL tempo
    CALL afficher7
    CALL tempo
    CALL afficher8
    CALL tempo
    CALL afficher9
    CALL tempo
    GOTO boucle_digit1

tempo :
    MOVLW B'0011100100000000' ;Valeur de la tempo
    MOVWF Valeur_tempo
Do :
    DECSFZ Valeur_tempo, 1
    goto $-1
    RETURN
clean :
    BCF PORTD
afficher0 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 4
    BSF PORTD, 5
    BSF PORTD, 6
afficher1 : 
    CALL clean
    BSF PORTD, 1
    BSF PORTD, 2
afficher2 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 3
    BSF PORTD, 4
    BSF PORTD, 6
afficher3 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 6
afficher4 :
    CALL clean
    BCF PORTD
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 5
    BSF PORTD, 6
afficher5 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 5
    BSF PORTD, 6
afficher6 : 
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 4
    BSF PORTD, 5
    BSF PORTD, 6
afficher7 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
afficher8 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 4
    BSF PORTD, 5
    BSF PORTD, 6
    BSF PORTD, 7
afficher9 :
    CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 5
    BSF PORTD, 6

END