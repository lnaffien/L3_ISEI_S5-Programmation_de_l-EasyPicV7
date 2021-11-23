#include <P16F877A.inc>
__CONFIG _HS_OSC & _WDT_OFF & _LVP_OFF      
CBLOCK 0x20 ;Reserver une zone de variable 
    vt: 1
    ENDC

org 0x0000
goto main

main:
    ;Initialisation
    BSF STATUS, RP0 ;Aller a la page memoire 1
    BCF STATUS, RP1
   ; BCF TRISA, 0	;PORTA PIN0 = sortie
    CLRF TRISA
	CLRF TRISD		;PORTD = sortie
    BCF STATUS, RP0 ;Retour a la page memoire 0
	BCF STATUS, RP1

    GOTO boucle ;Test de l'initialisation et de la syntaxe pour l'affichage
boucle:
BSF PORTA,0
BSF PORTA,1	
;	CALL tempo
  CALL afficher0
;afficher0:
  ;  CALL clean
     CALL tempo
	CALL tempo
	;CALL clean
    GOTO boucle
tempo:
    MOVLW B'11110011' ;Valeur de la tempo. 0xFF : 
    MOVWF vt
Do:
    DECFSZ vt, 1
    goto $-1
    RETURN
;clean:
;    BCF PORTD, 0
;    BCF PORTD, 1
;    BCF PORTD, 2
;    BCF PORTD, 3
;    BCF PORTD, 4
;    BCF PORTD, 5
;    BCF PORTD, 6
afficher0:
   ; CALL clean
    BSF PORTD, 0
    BSF PORTD, 1
    BSF PORTD, 2
    BSF PORTD, 3
    BSF PORTD, 4
    BSF PORTD, 5
	RETURN
;afficher1:
;    CALL clean
;    BSF PORTD, 1
;    BSF PORTD, 2
;	RETURN
;afficher2:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 1
;    BSF PORTD, 3
;    BSF PORTD, 4
;    BSF PORTD, 6
;	RETURN
;afficher3:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 1
;    BSF PORTD, 2
;    BSF PORTD, 3
;    BSF PORTD, 6
;	RETURN
;afficher4:
;    CALL clean
;    BSF PORTD, 1
;    BSF PORTD, 2
;    BSF PORTD, 5
;    BSF PORTD, 6
;	RETURN
;afficher5:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 2
;    BSF PORTD, 3
;    BSF PORTD, 5
;    BSF PORTD, 6
;	RETURN
;afficher6: 
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 2
;    BSF PORTD, 3
;    BSF PORTD, 4
;    BSF PORTD, 5
;    BSF PORTD, 6
;	RETURN
;afficher7:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 1
;    BSF PORTD, 2
;	RETURN
;afficher8:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 1
;    BSF PORTD, 2
;    BSF PORTD, 3
;    BSF PORTD, 4
;    BSF PORTD, 5
;    BSF PORTD, 6
;    BSF PORTD, 7
;	RETURN
;afficher9:
;    CALL clean
;    BSF PORTD, 0
;    BSF PORTD, 1
;    BSF PORTD, 2
;    BSF PORTD, 3
;    BSF PORTD, 5
;    BSF PORTD, 6
;	RETURN

END
