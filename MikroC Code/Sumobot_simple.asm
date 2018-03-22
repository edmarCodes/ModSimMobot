
_main:

;Sumobot_simple.c,13 :: 		void main() {
;Sumobot_simple.c,15 :: 		TRISB =0xF0; // Set to Output   RB0 to RB3 to Output and RB4 to RB7 to  Output
	MOVLW      240
	MOVWF      TRISB+0
;Sumobot_simple.c,16 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Sumobot_simple.c,17 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Sumobot_simple.c,19 :: 		PORTB =0;
	CLRF       PORTB+0
;Sumobot_simple.c,20 :: 		uart_debug_Init();
	CALL       _uart_debug_Init+0
;Sumobot_simple.c,21 :: 		inputManager_Init();
	CALL       _inputManager_Init+0
;Sumobot_simple.c,22 :: 		motorManager_Init();
	CALL       _motorManager_Init+0
;Sumobot_simple.c,23 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Sumobot_simple.c,24 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Sumobot_simple.c,26 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Sumobot_simple.c,27 :: 		RCSTA |= 0x80;
	BSF        RCSTA+0, 7
;Sumobot_simple.c,29 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;Sumobot_simple.c,31 :: 		for(;;)
L_main1:
;Sumobot_simple.c,33 :: 		inputManager_UpdateManager();
	CALL       _inputManager_UpdateManager+0
;Sumobot_simple.c,34 :: 		motorManager_UpdateManager2();
	CALL       _motorManager_UpdateManager2+0
;Sumobot_simple.c,36 :: 		uart_debug_Update();
	CALL       _uart_debug_Update+0
;Sumobot_simple.c,42 :: 		}
	GOTO       L_main1
;Sumobot_simple.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
