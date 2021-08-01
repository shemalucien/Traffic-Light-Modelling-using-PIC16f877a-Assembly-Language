#include "p16f877a.inc"

; CONFIG
; __config 0xFFFF
 __CONFIG _FOSC_EXTRC & _WDTE_ON & _PWRTE_OFF & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF
STATUS  equ 03h
PORTA   equ 05h
TRISA   equ 85h
   RP0 equ 05h
   RP1 equ 06h

COUNTER1 equ 0x0C
COUNTER2 equ 0x0D
        org 00h
        clrw
        BCF    STATUS,RP0
        BCF    STATUS,RP1
        CLRF   PORTA
        BSF    STATUS, RP0
        MOVLW  0x00 
        MOVWF  TRISA
        BCF    STATUS, RP0

START    MOVLW   0x02
         MOVWF   PORTA
	 call    first_delay
	 MOVLW   0x04
         MOVWF   PORTA
	 call    first_delay
	 MOVLW   0x08
         MOVWF   PORTA
	 call    second_delay

         GOTO    START
;delay  
first_delay MOVLW d'40'
	   MOVWF COUNTER1
dec_2      MOVLW d'255'
	   MOVWF COUNTER2
dec_1      DECFSZ  COUNTER2,1
	   goto  dec_1
	   DECFSZ  COUNTER1,1
	   goto  dec_2
	   return
second_delay MOVLW d'10'
	   MOVWF COUNTER1
dec_4      MOVLW d'255'
	   MOVWF COUNTER2
dec_3      DECFSZ  COUNTER2,1
	   goto  dec_3
	   DECFSZ  COUNTER1,1
	   goto  dec_4
	   return
         
END