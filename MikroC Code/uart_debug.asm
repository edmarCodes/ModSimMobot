
_uart_debug_Init:

;uart_debug.c,11 :: 		void uart_debug_Init(void)
;uart_debug.c,14 :: 		}
L_end_uart_debug_Init:
	RETURN
; end of _uart_debug_Init

_uart_debug_Update:

;uart_debug.c,20 :: 		void uart_debug_Update(void)
;uart_debug.c,24 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update0:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update0
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update0
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update0
	NOP
	NOP
;uart_debug.c,25 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,27 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update1:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update1
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update1
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update1
	NOP
	NOP
;uart_debug.c,28 :: 		UART1_Write(1);
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,29 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update2:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update2
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update2
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update2
	NOP
	NOP
;uart_debug.c,30 :: 		UART1_Write(inputManager_GetState());
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,32 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update3:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update3
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update3
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update3
	NOP
	NOP
;uart_debug.c,33 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,34 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update4:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update4
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update4
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update4
	NOP
	NOP
;uart_debug.c,35 :: 		UART1_Write(2);
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,36 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update5:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update5
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update5
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update5
	NOP
	NOP
;uart_debug.c,37 :: 		UART1_Write(motorManager_GetState());
	CALL       _motorManager_GetState+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,39 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update6:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update6
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update6
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update6
	NOP
	NOP
;uart_debug.c,40 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,41 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update7:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update7
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update7
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update7
	NOP
	NOP
;uart_debug.c,42 :: 		UART1_Write(3);
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,43 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update8:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update8
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update8
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update8
	NOP
	NOP
;uart_debug.c,44 :: 		UART1_Write(lineManager_GetState());
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,46 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update9:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update9
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update9
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update9
	NOP
	NOP
;uart_debug.c,47 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,48 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update10:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update10
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update10
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update10
	NOP
	NOP
;uart_debug.c,49 :: 		UART1_Write(9);
	MOVLW      9
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,50 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update11:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update11
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update11
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update11
	NOP
	NOP
;uart_debug.c,51 :: 		UART1_Write(MAJOR_VERSION);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,52 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_uart_debug_Update12:
	DECFSZ     R13+0, 1
	GOTO       L_uart_debug_Update12
	DECFSZ     R12+0, 1
	GOTO       L_uart_debug_Update12
	DECFSZ     R11+0, 1
	GOTO       L_uart_debug_Update12
	NOP
	NOP
;uart_debug.c,53 :: 		UART1_Write(MINOR_VERSION);
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,55 :: 		}
L_end_uart_debug_Update:
	RETURN
; end of _uart_debug_Update
