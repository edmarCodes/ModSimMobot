
_motorManager_GetState:

;motorManager.c,8 :: 		motor_manager_state_t motorManager_GetState(void)
;motorManager.c,10 :: 		return motor_manager_state;
	MOVF       _motor_manager_state+0, 0
	MOVWF      R0+0
;motorManager.c,11 :: 		}
L_end_motorManager_GetState:
	RETURN
; end of _motorManager_GetState

_motorManager_Init:

;motorManager.c,12 :: 		void motorManager_Init(void)
;motorManager.c,15 :: 		}
L_end_motorManager_Init:
	RETURN
; end of _motorManager_Init

_motorManager_UpdateManager:

;motorManager.c,17 :: 		void motorManager_UpdateManager(void)
;motorManager.c,19 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager0
;motorManager.c,21 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager2:
;motorManager.c,23 :: 		motor_manager_state =  MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,24 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,27 :: 		case MOTOR_OFF:
L_motorManager_UpdateManager3:
;motorManager.c,29 :: 		PORTB &= ~0x04;
	BCF        PORTB+0, 2
;motorManager.c,30 :: 		PORTB &= ~0x08;
	BCF        PORTB+0, 3
;motorManager.c,31 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,32 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,34 :: 		if(inputManager_GetState() ==LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager4
;motorManager.c,36 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,37 :: 		}
	GOTO       L_motorManager_UpdateManager5
L_motorManager_UpdateManager4:
;motorManager.c,38 :: 		else if(inputManager_GetState() ==RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager6
;motorManager.c,40 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,41 :: 		}
	GOTO       L_motorManager_UpdateManager7
L_motorManager_UpdateManager6:
;motorManager.c,42 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager8
;motorManager.c,44 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,45 :: 		}
L_motorManager_UpdateManager8:
L_motorManager_UpdateManager7:
L_motorManager_UpdateManager5:
;motorManager.c,48 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,50 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager9:
;motorManager.c,52 :: 		PORTB &= ~0x04;
	BCF        PORTB+0, 2
;motorManager.c,53 :: 		PORTB &= ~0x08;
	BCF        PORTB+0, 3
;motorManager.c,54 :: 		PWM1_Set_Duty(51);
	MOVLW      51
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,55 :: 		PWM2_Set_Duty(51);
	MOVLW      51
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,57 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager10
;motorManager.c,59 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,60 :: 		}
	GOTO       L_motorManager_UpdateManager11
L_motorManager_UpdateManager10:
;motorManager.c,61 :: 		else if(inputManager_GetState() ==RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager12
;motorManager.c,63 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,64 :: 		}
	GOTO       L_motorManager_UpdateManager13
L_motorManager_UpdateManager12:
;motorManager.c,65 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager14
;motorManager.c,67 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,68 :: 		}
L_motorManager_UpdateManager14:
L_motorManager_UpdateManager13:
L_motorManager_UpdateManager11:
;motorManager.c,69 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,71 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager15:
;motorManager.c,73 :: 		PORTB |= 0x04;
	BSF        PORTB+0, 2
;motorManager.c,74 :: 		PORTB |= 0x08;
	BSF        PORTB+0, 3
;motorManager.c,75 :: 		PWM1_Set_Duty(51);
	MOVLW      51
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,76 :: 		PWM2_Set_Duty(51);
	MOVLW      51
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,78 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager16
;motorManager.c,80 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,81 :: 		}
	GOTO       L_motorManager_UpdateManager17
L_motorManager_UpdateManager16:
;motorManager.c,82 :: 		else if(inputManager_GetState() ==LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager18
;motorManager.c,84 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,85 :: 		}
	GOTO       L_motorManager_UpdateManager19
L_motorManager_UpdateManager18:
;motorManager.c,86 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager20
;motorManager.c,88 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,89 :: 		}
L_motorManager_UpdateManager20:
L_motorManager_UpdateManager19:
L_motorManager_UpdateManager17:
;motorManager.c,93 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,96 :: 		case  BACKWARD:
L_motorManager_UpdateManager21:
;motorManager.c,98 :: 		PORTB &= ~0x04;
	BCF        PORTB+0, 2
;motorManager.c,99 :: 		PORTB |= 0x08;
	BSF        PORTB+0, 3
;motorManager.c,100 :: 		PWM1_Set_Duty(128);
	MOVLW      128
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,101 :: 		PWM2_Set_Duty(128);
	MOVLW      128
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,104 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,106 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,108 :: 		case DELAY:
L_motorManager_UpdateManager22:
;motorManager.c,110 :: 		PORTB &= ~0x04;
	BCF        PORTB+0, 2
;motorManager.c,111 :: 		PORTB |= 0x08;
	BSF        PORTB+0, 3
;motorManager.c,114 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager23:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager23
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager23
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager23
	NOP
;motorManager.c,115 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,116 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,117 :: 		Delay_ms(1500);
	MOVLW      39
	MOVWF      R11+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_motorManager_UpdateManager24:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager24
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager24
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager24
	NOP
;motorManager.c,119 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,121 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,123 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager25:
;motorManager.c,125 :: 		PORTB |= 0x04;
	BSF        PORTB+0, 2
;motorManager.c,126 :: 		PORTB &= ~0x08;
	BCF        PORTB+0, 3
;motorManager.c,127 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,128 :: 		PWM2_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,130 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager26
;motorManager.c,132 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,133 :: 		}
L_motorManager_UpdateManager26:
;motorManager.c,135 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,137 :: 		default:
L_motorManager_UpdateManager27:
;motorManager.c,138 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,142 :: 		}
L_motorManager_UpdateManager0:
	MOVF       _motor_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager2
	MOVF       _motor_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager3
	MOVF       _motor_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager9
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager15
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager21
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager22
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager25
	GOTO       L_motorManager_UpdateManager27
L_motorManager_UpdateManager1:
;motorManager.c,143 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,145 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,176 :: 		PORTB |= 0x04;
	BSF        PORTB+0, 2
;motorManager.c,177 :: 		PORTB &= ~0x08;
	BCF        PORTB+0, 3
;motorManager.c,178 :: 		PWM1_Set_Duty(204);
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,179 :: 		PWM2_Set_Duty(204);
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,181 :: 		DELAY_MS(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_motorManager_UpdateManager228:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager228
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager228
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager228
	NOP
	NOP
;motorManager.c,183 :: 		PORTB &= ~0x04;
	BCF        PORTB+0, 2
;motorManager.c,184 :: 		PORTB |= 0x08;
	BSF        PORTB+0, 3
;motorManager.c,185 :: 		PWM1_Set_Duty(204);
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,186 :: 		PWM2_Set_Duty(204);
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,188 :: 		DELAY_MS(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_motorManager_UpdateManager229:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager229
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager229
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager229
	NOP
	NOP
;motorManager.c,192 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
