
_uart_debug_Init:

;uart_debug.c,5 :: 		void uart_debug_Init(void)
;uart_debug.c,8 :: 		}
L_end_uart_debug_Init:
	RETURN
; end of _uart_debug_Init

_uart_debug_Update:

;uart_debug.c,10 :: 		void uart_debug_Update(void)
;uart_debug.c,14 :: 		Delay_ms(50);
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
;uart_debug.c,15 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,17 :: 		Delay_ms(50);
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
;uart_debug.c,18 :: 		UART1_Write(1);
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,19 :: 		Delay_ms(50);
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
;uart_debug.c,20 :: 		UART1_Write(inputManager_GetState());
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,22 :: 		Delay_ms(50);
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
;uart_debug.c,23 :: 		UART1_Write(0x65);
	MOVLW      101
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,24 :: 		Delay_ms(50);
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
;uart_debug.c,25 :: 		UART1_Write(2);
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,26 :: 		Delay_ms(50);
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
;uart_debug.c,27 :: 		UART1_Write(motorManager_GetState());
	CALL       _motorManager_GetState+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;uart_debug.c,30 :: 		}
L_end_uart_debug_Update:
	RETURN
; end of _uart_debug_Update
