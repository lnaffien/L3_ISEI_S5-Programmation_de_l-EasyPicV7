#include <P16F877A.inc>

__CONFIG _HS_OSC & _WDT_OFF & _LVP_OFF

	;Declaration
      CBLOCK 0x20 ;Reserver une zone de variable
      V1:      1 ;1 pour 1 octet
      V2:      1
      ENDC

      org      0x0000
      goto      main

main:
      BSF      STATUS,5
      BCF      STATUS,6
      BCF	   TRISE, 2
      BCF	      STATUS,5
      BCF 		STATUS,6
      BSF      PORTE,2
      CALL      tempo
      BCF      PORTE,2
      CALL      tempo
      GOTO      main

tempo:
      ;Move Litteral to W
      MOVLW      B'11111001';valeur max qu'on peut utiliser pour la temporisation: B'00100001' 
      ;Move W to F
      MOVWF      V1
Do:   MOVWF      V2
        ;Decrement F, Skip if 0
	  DECFSZ      V2,1
      goto      $-1
	  DECFSZ      V1,1 ;Le petit d est un switch, si on met d=0   on stoque dans W, sinon dans le file register
      GOTO      Do
      
      RETURN

END
