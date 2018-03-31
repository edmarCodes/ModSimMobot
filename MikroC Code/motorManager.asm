
_motorManager_GetState:

;motorManager.c,13 :: 		motor_manager_state_t motorManager_GetState(void)
;motorManager.c,15 :: 		return motor_manager_state;
	MOVF       _motor_manager_state+0, 0
	MOVWF      R0+0
;motorManager.c,16 :: 		}
L_end_motorManager_GetState:
	RETURN
; end of _motorManager_GetState

_motorManager_Init:

;motorManager.c,22 :: 		void motorManager_Init(void)
;motorManager.c,25 :: 		}
L_end_motorManager_Init:
	RETURN
; end of _motorManager_Init

_motorManager_UpdateManager:

;motorManager.c,31 :: 		void motorManager_UpdateManager(void)
;motorManager.c,33 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager0
;motorManager.c,35 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager2:
;motorManager.c,37 :: 		motor_manager_state =  MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,38 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,41 :: 		case MOTOR_STANDBY:
L_motorManager_UpdateManager3:
;motorManager.c,48 :: 		if(inputManager_GetState() == LEFT_SIGHT || inputManager_GetState() == NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager59
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager59
	GOTO       L_motorManager_UpdateManager6
L__motorManager_UpdateManager59:
;motorManager.c,50 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,51 :: 		}
	GOTO       L_motorManager_UpdateManager7
L_motorManager_UpdateManager6:
;motorManager.c,52 :: 		else if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager8
;motorManager.c,54 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,55 :: 		}
	GOTO       L_motorManager_UpdateManager9
L_motorManager_UpdateManager8:
;motorManager.c,56 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager10
;motorManager.c,58 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,59 :: 		}
L_motorManager_UpdateManager10:
L_motorManager_UpdateManager9:
L_motorManager_UpdateManager7:
;motorManager.c,62 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,64 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager11:
;motorManager.c,65 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,66 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,67 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,68 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,70 :: 		if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager12
;motorManager.c,72 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,73 :: 		}
	GOTO       L_motorManager_UpdateManager13
L_motorManager_UpdateManager12:
;motorManager.c,74 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager14
;motorManager.c,76 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,77 :: 		}else if(lineManager_GetState() == HALF_LEFT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT){
	GOTO       L_motorManager_UpdateManager15
L_motorManager_UpdateManager14:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager58
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager58
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager58
	GOTO       L_motorManager_UpdateManager18
L__motorManager_UpdateManager58:
;motorManager.c,78 :: 		motor_manager_state = LINE_RIGHT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,79 :: 		}
L_motorManager_UpdateManager18:
L_motorManager_UpdateManager15:
L_motorManager_UpdateManager13:
;motorManager.c,80 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,82 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager19:
;motorManager.c,83 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,84 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,85 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,86 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,88 :: 		if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager20
;motorManager.c,90 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,91 :: 		}
	GOTO       L_motorManager_UpdateManager21
L_motorManager_UpdateManager20:
;motorManager.c,92 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager22
;motorManager.c,94 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,95 :: 		}else if(lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_RIGHT){
	GOTO       L_motorManager_UpdateManager23
L_motorManager_UpdateManager22:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager57
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager57
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager57
	GOTO       L_motorManager_UpdateManager26
L__motorManager_UpdateManager57:
;motorManager.c,96 :: 		motor_manager_state = LINE_LEFT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,97 :: 		}
L_motorManager_UpdateManager26:
L_motorManager_UpdateManager23:
L_motorManager_UpdateManager21:
;motorManager.c,99 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,101 :: 		case  BACKWARD:
L_motorManager_UpdateManager27:
;motorManager.c,103 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,104 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,105 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,106 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,108 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,110 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,112 :: 		case DELAY:
L_motorManager_UpdateManager28:
;motorManager.c,114 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,115 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,117 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager29:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager29
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager29
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager29
	NOP
;motorManager.c,118 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,119 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,120 :: 		Delay_ms(1500);
	MOVLW      39
	MOVWF      R11+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_motorManager_UpdateManager30:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager30
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager30
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager30
	NOP
;motorManager.c,122 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,124 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,126 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager31:
;motorManager.c,128 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,129 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,130 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,131 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,133 :: 		if(inputManager_GetState() == NO_SIGHT && lineManager_GetState() == NO_LINE){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager34
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager34
L__motorManager_UpdateManager56:
;motorManager.c,134 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,135 :: 		}else if(inputManager_GetState() == LEFT_SIGHT)
	GOTO       L_motorManager_UpdateManager35
L_motorManager_UpdateManager34:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager36
;motorManager.c,137 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,138 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager37
L_motorManager_UpdateManager36:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager38
;motorManager.c,140 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,141 :: 		}else if(inputManager_GetState() == NO_SIGHT && (lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT
	GOTO       L_motorManager_UpdateManager39
L_motorManager_UpdateManager38:
	CALL       _inputManager_GetState+0
;motorManager.c,142 :: 		|| lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_LEFT || lineManager_GetState() == HALF_RIGHT))
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager44
;motorManager.c,141 :: 		}else if(inputManager_GetState() == NO_SIGHT && (lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager55
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager55
;motorManager.c,142 :: 		|| lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_LEFT || lineManager_GetState() == HALF_RIGHT))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager55
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager55
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager55
	GOTO       L_motorManager_UpdateManager44
L__motorManager_UpdateManager55:
L__motorManager_UpdateManager54:
;motorManager.c,144 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,145 :: 		}
L_motorManager_UpdateManager44:
L_motorManager_UpdateManager39:
L_motorManager_UpdateManager37:
L_motorManager_UpdateManager35:
;motorManager.c,146 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,148 :: 		case LINE_LEFT:
L_motorManager_UpdateManager45:
;motorManager.c,150 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,151 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,152 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,153 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,155 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager46:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager46
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager46
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager46
	NOP
;motorManager.c,157 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,159 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,161 :: 		case LINE_RIGHT:
L_motorManager_UpdateManager47:
;motorManager.c,163 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,164 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,165 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,166 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,168 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager48:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager48
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager48
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager48
	NOP
;motorManager.c,170 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,172 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,174 :: 		case LINE_FORWARD:
L_motorManager_UpdateManager49:
;motorManager.c,176 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,177 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,178 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,179 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,181 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager50:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager50
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager50
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager50
	NOP
;motorManager.c,183 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,185 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,187 :: 		case LINE_BACKWARD:
L_motorManager_UpdateManager51:
;motorManager.c,189 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,190 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,191 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,192 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,194 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_motorManager_UpdateManager52:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager52
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager52
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager52
	NOP
	NOP
;motorManager.c,196 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,198 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,200 :: 		default:
L_motorManager_UpdateManager53:
;motorManager.c,201 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,203 :: 		}
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
	GOTO       L_motorManager_UpdateManager11
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager19
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager27
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager28
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager31
	MOVF       _motor_manager_state+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager45
	MOVF       _motor_manager_state+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager47
	MOVF       _motor_manager_state+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager49
	MOVF       _motor_manager_state+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager51
	GOTO       L_motorManager_UpdateManager53
L_motorManager_UpdateManager1:
;motorManager.c,204 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,206 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,251 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
