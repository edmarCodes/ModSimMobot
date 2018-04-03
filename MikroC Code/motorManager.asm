
_motorManager_GetState:

;motorManager.c,14 :: 		motor_manager_state_t motorManager_GetState(void)
;motorManager.c,16 :: 		return motor_manager_state;
	MOVF       _motor_manager_state+0, 0
	MOVWF      R0+0
;motorManager.c,17 :: 		}
L_end_motorManager_GetState:
	RETURN
; end of _motorManager_GetState

_motorManager_Init:

;motorManager.c,23 :: 		void motorManager_Init(void)
;motorManager.c,26 :: 		}
L_end_motorManager_Init:
	RETURN
; end of _motorManager_Init

_motorManager_UpdateManager:

;motorManager.c,32 :: 		void motorManager_UpdateManager(void)
;motorManager.c,34 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager0
;motorManager.c,36 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager2:
;motorManager.c,38 :: 		motor_manager_state =  MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,39 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,42 :: 		case MOTOR_STANDBY:
L_motorManager_UpdateManager3:
;motorManager.c,49 :: 		if(inputManager_GetState() == LEFT_SIGHT || inputManager_GetState() == NO_SIGHT || lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager94
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager94
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager94
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager94
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager94
	GOTO       L_motorManager_UpdateManager6
L__motorManager_UpdateManager94:
;motorManager.c,51 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,52 :: 		}
	GOTO       L_motorManager_UpdateManager7
L_motorManager_UpdateManager6:
;motorManager.c,53 :: 		else if(inputManager_GetState() == RIGHT_SIGHT || lineManager_GetState() == PARTIAL_LEFT || lineManager_GetState() == HALF_LEFT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager93
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager93
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager93
	GOTO       L_motorManager_UpdateManager10
L__motorManager_UpdateManager93:
;motorManager.c,55 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,56 :: 		}
	GOTO       L_motorManager_UpdateManager11
L_motorManager_UpdateManager10:
;motorManager.c,57 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager12
;motorManager.c,59 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,60 :: 		}
L_motorManager_UpdateManager12:
L_motorManager_UpdateManager11:
L_motorManager_UpdateManager7:
;motorManager.c,63 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,65 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager13:
;motorManager.c,66 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,67 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,68 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,69 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,71 :: 		if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager14
;motorManager.c,73 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,74 :: 		}
	GOTO       L_motorManager_UpdateManager15
L_motorManager_UpdateManager14:
;motorManager.c,75 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager16
;motorManager.c,77 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,78 :: 		}else if(lineManager_GetState() == HALF_LEFT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT){
	GOTO       L_motorManager_UpdateManager17
L_motorManager_UpdateManager16:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager92
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager92
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager92
	GOTO       L_motorManager_UpdateManager20
L__motorManager_UpdateManager92:
;motorManager.c,79 :: 		motor_manager_state = LINE_RIGHT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,80 :: 		}
L_motorManager_UpdateManager20:
L_motorManager_UpdateManager17:
L_motorManager_UpdateManager15:
;motorManager.c,81 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,83 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager21:
;motorManager.c,84 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,85 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,86 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,87 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,89 :: 		if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager22
;motorManager.c,91 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,92 :: 		}
	GOTO       L_motorManager_UpdateManager23
L_motorManager_UpdateManager22:
;motorManager.c,93 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager24
;motorManager.c,95 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,96 :: 		}else if(lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_RIGHT){
	GOTO       L_motorManager_UpdateManager25
L_motorManager_UpdateManager24:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager91
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager91
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager91
	GOTO       L_motorManager_UpdateManager28
L__motorManager_UpdateManager91:
;motorManager.c,97 :: 		motor_manager_state = LINE_LEFT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,98 :: 		}
L_motorManager_UpdateManager28:
L_motorManager_UpdateManager25:
L_motorManager_UpdateManager23:
;motorManager.c,100 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,102 :: 		case  BACKWARD:
L_motorManager_UpdateManager29:
;motorManager.c,104 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,105 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,106 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,107 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,109 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,111 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,113 :: 		case DELAY:
L_motorManager_UpdateManager30:
;motorManager.c,115 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,116 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,118 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager31:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager31
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager31
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager31
	NOP
;motorManager.c,119 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,120 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,121 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager32:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager32
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager32
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager32
	NOP
;motorManager.c,123 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,125 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,127 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager33:
;motorManager.c,129 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,130 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,131 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,132 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,134 :: 		if(inputManager_GetState() == NO_SIGHT && lineManager_GetState() == NO_LINE){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager36
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager36
L__motorManager_UpdateManager90:
;motorManager.c,135 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,136 :: 		}else if(inputManager_GetState() == LEFT_SIGHT)
	GOTO       L_motorManager_UpdateManager37
L_motorManager_UpdateManager36:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager38
;motorManager.c,138 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,139 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager39
L_motorManager_UpdateManager38:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager40
;motorManager.c,141 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,142 :: 		}else if(inputManager_GetState() == NO_SIGHT && (lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT
	GOTO       L_motorManager_UpdateManager41
L_motorManager_UpdateManager40:
	CALL       _inputManager_GetState+0
;motorManager.c,143 :: 		|| lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_LEFT || lineManager_GetState() == HALF_RIGHT))
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager46
;motorManager.c,142 :: 		}else if(inputManager_GetState() == NO_SIGHT && (lineManager_GetState() == FULL || lineManager_GetState() == PARTIAL_LEFT
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager89
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager89
;motorManager.c,143 :: 		|| lineManager_GetState() == PARTIAL_RIGHT || lineManager_GetState() == HALF_LEFT || lineManager_GetState() == HALF_RIGHT))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager89
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager89
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager89
	GOTO       L_motorManager_UpdateManager46
L__motorManager_UpdateManager89:
L__motorManager_UpdateManager88:
;motorManager.c,145 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,146 :: 		}
L_motorManager_UpdateManager46:
L_motorManager_UpdateManager41:
L_motorManager_UpdateManager39:
L_motorManager_UpdateManager37:
;motorManager.c,147 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,149 :: 		case LINE_LEFT:
L_motorManager_UpdateManager47:
;motorManager.c,151 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,152 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,153 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,154 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,156 :: 		Delay_ms(1000);
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
;motorManager.c,158 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,160 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,162 :: 		case LINE_RIGHT:
L_motorManager_UpdateManager49:
;motorManager.c,164 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,165 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,166 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,167 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,169 :: 		Delay_ms(1000);
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
;motorManager.c,171 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,173 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,175 :: 		case LINE_FORWARD:
L_motorManager_UpdateManager51:
;motorManager.c,177 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,178 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,179 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,180 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,182 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager52:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager52
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager52
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager52
	NOP
;motorManager.c,184 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,186 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,188 :: 		case LINE_BACKWARD:
L_motorManager_UpdateManager53:
;motorManager.c,190 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,191 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,192 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,193 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,195 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager54:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager54
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager54
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager54
	NOP
;motorManager.c,197 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,199 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,201 :: 		default:
L_motorManager_UpdateManager55:
;motorManager.c,202 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,204 :: 		}
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
	GOTO       L_motorManager_UpdateManager13
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager21
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager29
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager30
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager33
	MOVF       _motor_manager_state+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager47
	MOVF       _motor_manager_state+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager49
	MOVF       _motor_manager_state+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager51
	MOVF       _motor_manager_state+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager53
	GOTO       L_motorManager_UpdateManager55
L_motorManager_UpdateManager1:
;motorManager.c,205 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,207 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,209 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager256
;motorManager.c,211 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager258:
;motorManager.c,213 :: 		motor_manager_state =  MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,214 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,217 :: 		case MOTOR_STANDBY:
L_motorManager_UpdateManager259:
;motorManager.c,224 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager260
;motorManager.c,226 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,227 :: 		}else if(inputManager_GetState() == LEFT_SIGHT || inputManager_GetState() == NO_SIGHT )
	GOTO       L_motorManager_UpdateManager261
L_motorManager_UpdateManager260:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager295
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager295
	GOTO       L_motorManager_UpdateManager264
L__motorManager_UpdateManager295:
;motorManager.c,229 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,230 :: 		}
	GOTO       L_motorManager_UpdateManager265
L_motorManager_UpdateManager264:
;motorManager.c,231 :: 		else if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,233 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,234 :: 		}
L_motorManager_UpdateManager266:
L_motorManager_UpdateManager265:
L_motorManager_UpdateManager261:
;motorManager.c,237 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,239 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager267:
;motorManager.c,240 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,241 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,242 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,243 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,245 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager268
;motorManager.c,247 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,248 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager269
L_motorManager_UpdateManager268:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager270
;motorManager.c,250 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,251 :: 		}
L_motorManager_UpdateManager270:
L_motorManager_UpdateManager269:
;motorManager.c,253 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,255 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager271:
;motorManager.c,256 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,257 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,258 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,259 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,261 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager272
;motorManager.c,263 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,264 :: 		}
	GOTO       L_motorManager_UpdateManager273
L_motorManager_UpdateManager272:
;motorManager.c,265 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager274
;motorManager.c,267 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,268 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager275
L_motorManager_UpdateManager274:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager276
;motorManager.c,270 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,271 :: 		}
L_motorManager_UpdateManager276:
L_motorManager_UpdateManager275:
L_motorManager_UpdateManager273:
;motorManager.c,273 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,275 :: 		case  BACKWARD:
L_motorManager_UpdateManager277:
;motorManager.c,282 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,284 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,286 :: 		case DELAY:
L_motorManager_UpdateManager278:
;motorManager.c,288 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,289 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,291 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager279:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager279
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager279
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager279
	NOP
;motorManager.c,292 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,293 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,294 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager280:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager280
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager280
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager280
	NOP
;motorManager.c,296 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,298 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,300 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager281:
;motorManager.c,302 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,303 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,304 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,305 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,307 :: 		if(inputManager_GetState() == NO_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager282
;motorManager.c,308 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,309 :: 		}
	GOTO       L_motorManager_UpdateManager283
L_motorManager_UpdateManager282:
;motorManager.c,310 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager284
;motorManager.c,312 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,313 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager285
L_motorManager_UpdateManager284:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager286
;motorManager.c,315 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,316 :: 		}
L_motorManager_UpdateManager286:
L_motorManager_UpdateManager285:
L_motorManager_UpdateManager283:
;motorManager.c,317 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,318 :: 		default:
L_motorManager_UpdateManager287:
;motorManager.c,319 :: 		break;
	GOTO       L_motorManager_UpdateManager257
;motorManager.c,320 :: 		}
L_motorManager_UpdateManager256:
	MOVF       _motor_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager258
	MOVF       _motor_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager259
	MOVF       _motor_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager267
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager271
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager277
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager278
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager281
	GOTO       L_motorManager_UpdateManager287
L_motorManager_UpdateManager257:
;motorManager.c,322 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
