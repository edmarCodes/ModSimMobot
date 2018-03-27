
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
;motorManager.c,29 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,30 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,31 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,32 :: 		motorManager_MotorBOff();
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
;motorManager.c,51 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,52 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,53 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,54 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,56 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager10
;motorManager.c,58 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,59 :: 		}
	GOTO       L_motorManager_UpdateManager11
L_motorManager_UpdateManager10:
;motorManager.c,60 :: 		else if(inputManager_GetState() ==RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager12
;motorManager.c,62 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,63 :: 		}
	GOTO       L_motorManager_UpdateManager13
L_motorManager_UpdateManager12:
;motorManager.c,64 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager14
;motorManager.c,66 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,67 :: 		}
L_motorManager_UpdateManager14:
L_motorManager_UpdateManager13:
L_motorManager_UpdateManager11:
;motorManager.c,68 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,70 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager15:
;motorManager.c,71 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,72 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,73 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,74 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,76 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager16
;motorManager.c,78 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,79 :: 		}
	GOTO       L_motorManager_UpdateManager17
L_motorManager_UpdateManager16:
;motorManager.c,80 :: 		else if(inputManager_GetState() ==LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager18
;motorManager.c,82 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,83 :: 		}
	GOTO       L_motorManager_UpdateManager19
L_motorManager_UpdateManager18:
;motorManager.c,84 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager20
;motorManager.c,86 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,87 :: 		}
L_motorManager_UpdateManager20:
L_motorManager_UpdateManager19:
L_motorManager_UpdateManager17:
;motorManager.c,91 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,94 :: 		case  BACKWARD:
L_motorManager_UpdateManager21:
;motorManager.c,96 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,97 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,98 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,99 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,101 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,103 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,105 :: 		case DELAY:
L_motorManager_UpdateManager22:
;motorManager.c,107 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,108 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,110 :: 		Delay_ms(1000);
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
;motorManager.c,111 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,112 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,113 :: 		Delay_ms(1500);
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
;motorManager.c,115 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,117 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,119 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager25:
;motorManager.c,121 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,122 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,123 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,124 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,126 :: 		if(inputManager_GetState() ==NO_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager26
;motorManager.c,127 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,128 :: 		}
L_motorManager_UpdateManager26:
;motorManager.c,130 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,132 :: 		default:
L_motorManager_UpdateManager27:
;motorManager.c,133 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,135 :: 		}
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
;motorManager.c,136 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,138 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,183 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
