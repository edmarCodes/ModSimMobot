
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
;motorManager.c,49 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,50 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager4
;motorManager.c,52 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,53 :: 		}
	GOTO       L_motorManager_UpdateManager5
L_motorManager_UpdateManager4:
;motorManager.c,54 :: 		else if( (inputManager_GetState() == LEFT_SIGHT) || (inputManager_GetState() == NO_SIGHT) || (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_RIGHT) || (lineManager_GetState() == FULL) )
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	GOTO       L_motorManager_UpdateManager8
L__motorManager_UpdateManager106:
;motorManager.c,56 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,57 :: 		}
	GOTO       L_motorManager_UpdateManager9
L_motorManager_UpdateManager8:
;motorManager.c,58 :: 		else if( (inputManager_GetState() == RIGHT_SIGHT) || (lineManager_GetState() == PARTIAL_LEFT) || (lineManager_GetState() == HALF_LEFT) )
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	GOTO       L_motorManager_UpdateManager12
L__motorManager_UpdateManager105:
;motorManager.c,60 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,61 :: 		}
L_motorManager_UpdateManager12:
L_motorManager_UpdateManager9:
L_motorManager_UpdateManager5:
;motorManager.c,65 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,67 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager13:
;motorManager.c,68 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,69 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,70 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,71 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,73 :: 		if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager14
;motorManager.c,75 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,76 :: 		}
	GOTO       L_motorManager_UpdateManager15
L_motorManager_UpdateManager14:
;motorManager.c,77 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager16
;motorManager.c,79 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,80 :: 		}
	GOTO       L_motorManager_UpdateManager17
L_motorManager_UpdateManager16:
;motorManager.c,81 :: 		else if( (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT) ){
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	GOTO       L_motorManager_UpdateManager20
L__motorManager_UpdateManager104:
;motorManager.c,82 :: 		motor_manager_state = LINE_RIGHT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,83 :: 		}
L_motorManager_UpdateManager20:
L_motorManager_UpdateManager17:
L_motorManager_UpdateManager15:
;motorManager.c,84 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,86 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager21:
;motorManager.c,87 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,88 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,89 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,90 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,92 :: 		if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager22
;motorManager.c,94 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,95 :: 		}
	GOTO       L_motorManager_UpdateManager23
L_motorManager_UpdateManager22:
;motorManager.c,96 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager24
;motorManager.c,98 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,99 :: 		}else if( (lineManager_GetState() == HALF_RIGHT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_RIGHT) ){
	GOTO       L_motorManager_UpdateManager25
L_motorManager_UpdateManager24:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager103
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager103
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager103
	GOTO       L_motorManager_UpdateManager28
L__motorManager_UpdateManager103:
;motorManager.c,100 :: 		motor_manager_state = LINE_LEFT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,101 :: 		}
L_motorManager_UpdateManager28:
L_motorManager_UpdateManager25:
L_motorManager_UpdateManager23:
;motorManager.c,103 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,105 :: 		case  BACKWARD:
L_motorManager_UpdateManager29:
;motorManager.c,112 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,114 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,116 :: 		case DELAY:
L_motorManager_UpdateManager30:
;motorManager.c,122 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,123 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,124 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager31:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager31
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager31
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager31
	NOP
;motorManager.c,125 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,127 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,129 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager32:
;motorManager.c,131 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,132 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,133 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,134 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,137 :: 		if(inputManager_GetState() == BOTH_SIGHT && (lineManager_GetState() == NO_LINE))
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager35
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager35
L__motorManager_UpdateManager102:
;motorManager.c,139 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,140 :: 		}else if( (inputManager_GetState()) == BOTH_SIGHT && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	GOTO       L_motorManager_UpdateManager36
L_motorManager_UpdateManager35:
	CALL       _inputManager_GetState+0
;motorManager.c,141 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager41
;motorManager.c,140 :: 		}else if( (inputManager_GetState()) == BOTH_SIGHT && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager101
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager101
;motorManager.c,141 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager101
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager101
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager101
	GOTO       L_motorManager_UpdateManager41
L__motorManager_UpdateManager101:
L__motorManager_UpdateManager100:
;motorManager.c,143 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,144 :: 		}
	GOTO       L_motorManager_UpdateManager42
L_motorManager_UpdateManager41:
;motorManager.c,145 :: 		else if( (inputManager_GetState() == NO_SIGHT) && (lineManager_GetState() == NO_LINE) ){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager45
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager45
L__motorManager_UpdateManager99:
;motorManager.c,146 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,147 :: 		}else if(inputManager_GetState() == LEFT_SIGHT)
	GOTO       L_motorManager_UpdateManager46
L_motorManager_UpdateManager45:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager47
;motorManager.c,149 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,150 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager48
L_motorManager_UpdateManager47:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager49
;motorManager.c,152 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,153 :: 		}else if( (inputManager_GetState() == NO_SIGHT) && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	GOTO       L_motorManager_UpdateManager50
L_motorManager_UpdateManager49:
	CALL       _inputManager_GetState+0
;motorManager.c,154 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager55
;motorManager.c,153 :: 		}else if( (inputManager_GetState() == NO_SIGHT) && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager98
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager98
;motorManager.c,154 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager98
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager98
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager98
	GOTO       L_motorManager_UpdateManager55
L__motorManager_UpdateManager98:
L__motorManager_UpdateManager97:
;motorManager.c,156 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,157 :: 		}
L_motorManager_UpdateManager55:
L_motorManager_UpdateManager50:
L_motorManager_UpdateManager48:
L_motorManager_UpdateManager46:
L_motorManager_UpdateManager42:
L_motorManager_UpdateManager36:
;motorManager.c,158 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,160 :: 		case LINE_LEFT:
L_motorManager_UpdateManager56:
;motorManager.c,162 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,163 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,164 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,165 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,167 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager57:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager57
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager57
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager57
	NOP
;motorManager.c,169 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,171 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,173 :: 		case LINE_RIGHT:
L_motorManager_UpdateManager58:
;motorManager.c,174 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,175 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,176 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,177 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,179 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager59:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager59
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager59
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager59
	NOP
;motorManager.c,181 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,183 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,185 :: 		case LINE_FORWARD:
L_motorManager_UpdateManager60:
;motorManager.c,187 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,188 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,189 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,190 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,192 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_motorManager_UpdateManager61:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager61
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager61
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager61
	NOP
	NOP
;motorManager.c,194 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,196 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,198 :: 		case LINE_BACKWARD:
L_motorManager_UpdateManager62:
;motorManager.c,200 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,201 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,202 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,203 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,205 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_motorManager_UpdateManager63:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager63
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager63
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager63
	NOP
	NOP
;motorManager.c,207 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,209 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,211 :: 		default:
L_motorManager_UpdateManager64:
;motorManager.c,212 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,214 :: 		}
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
	GOTO       L_motorManager_UpdateManager32
	MOVF       _motor_manager_state+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager56
	MOVF       _motor_manager_state+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager58
	MOVF       _motor_manager_state+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager60
	MOVF       _motor_manager_state+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager62
	GOTO       L_motorManager_UpdateManager64
L_motorManager_UpdateManager1:
;motorManager.c,215 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,217 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,219 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager265
;motorManager.c,221 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager267:
;motorManager.c,223 :: 		motor_manager_state =  MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,224 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,227 :: 		case MOTOR_STANDBY:
L_motorManager_UpdateManager268:
;motorManager.c,234 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,236 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager269
;motorManager.c,238 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,239 :: 		}else if((inputManager_GetState() == LEFT_SIGHT) || (inputManager_GetState() == NO_SIGHT) )
	GOTO       L_motorManager_UpdateManager270
L_motorManager_UpdateManager269:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager2107
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager2107
	GOTO       L_motorManager_UpdateManager273
L__motorManager_UpdateManager2107:
;motorManager.c,241 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,242 :: 		}
	GOTO       L_motorManager_UpdateManager274
L_motorManager_UpdateManager273:
;motorManager.c,243 :: 		else if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager275
;motorManager.c,245 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,246 :: 		}
L_motorManager_UpdateManager275:
L_motorManager_UpdateManager274:
L_motorManager_UpdateManager270:
;motorManager.c,249 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,251 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager276:
;motorManager.c,252 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,253 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,254 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,255 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,257 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager277
;motorManager.c,259 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,260 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager278
L_motorManager_UpdateManager277:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager279
;motorManager.c,262 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,263 :: 		}
L_motorManager_UpdateManager279:
L_motorManager_UpdateManager278:
;motorManager.c,265 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,267 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager280:
;motorManager.c,268 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,269 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,270 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,271 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,273 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager281
;motorManager.c,275 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,276 :: 		}
	GOTO       L_motorManager_UpdateManager282
L_motorManager_UpdateManager281:
;motorManager.c,277 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager283
;motorManager.c,279 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,280 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager284
L_motorManager_UpdateManager283:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager285
;motorManager.c,282 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,283 :: 		}
L_motorManager_UpdateManager285:
L_motorManager_UpdateManager284:
L_motorManager_UpdateManager282:
;motorManager.c,285 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,287 :: 		case  BACKWARD:
L_motorManager_UpdateManager286:
;motorManager.c,294 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,296 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,298 :: 		case DELAY:
L_motorManager_UpdateManager287:
;motorManager.c,303 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager288:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager288
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager288
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager288
	NOP
;motorManager.c,304 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,305 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,306 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager289:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager289
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager289
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager289
	NOP
;motorManager.c,308 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,310 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,312 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager290:
;motorManager.c,314 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,315 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,316 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,317 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,319 :: 		if(inputManager_GetState() == NO_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager291
;motorManager.c,320 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,321 :: 		}
	GOTO       L_motorManager_UpdateManager292
L_motorManager_UpdateManager291:
;motorManager.c,322 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager293
;motorManager.c,324 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,325 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager294
L_motorManager_UpdateManager293:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager295
;motorManager.c,327 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,328 :: 		}
L_motorManager_UpdateManager295:
L_motorManager_UpdateManager294:
L_motorManager_UpdateManager292:
;motorManager.c,329 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,330 :: 		default:
L_motorManager_UpdateManager296:
;motorManager.c,331 :: 		break;
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,332 :: 		}
L_motorManager_UpdateManager265:
	MOVF       _motor_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager267
	MOVF       _motor_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager268
	MOVF       _motor_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager276
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager280
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager286
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager287
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager290
	GOTO       L_motorManager_UpdateManager296
L_motorManager_UpdateManager266:
;motorManager.c,334 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
