
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
	GOTO       L__motorManager_UpdateManager107
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager107
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager107
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager107
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager107
	GOTO       L_motorManager_UpdateManager8
L__motorManager_UpdateManager107:
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
	GOTO       L__motorManager_UpdateManager106
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager106
	GOTO       L_motorManager_UpdateManager12
L__motorManager_UpdateManager106:
;motorManager.c,60 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,61 :: 		}else{
	GOTO       L_motorManager_UpdateManager13
L_motorManager_UpdateManager12:
;motorManager.c,62 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,63 :: 		}
L_motorManager_UpdateManager13:
L_motorManager_UpdateManager9:
L_motorManager_UpdateManager5:
;motorManager.c,67 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,69 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager14:
;motorManager.c,70 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,71 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,72 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,73 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,75 :: 		if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager15
;motorManager.c,77 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,78 :: 		}
	GOTO       L_motorManager_UpdateManager16
L_motorManager_UpdateManager15:
;motorManager.c,79 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager17
;motorManager.c,81 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,82 :: 		}
	GOTO       L_motorManager_UpdateManager18
L_motorManager_UpdateManager17:
;motorManager.c,83 :: 		else if( (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT) ){
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager105
	GOTO       L_motorManager_UpdateManager21
L__motorManager_UpdateManager105:
;motorManager.c,84 :: 		motor_manager_state = LINE_RIGHT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,85 :: 		}
L_motorManager_UpdateManager21:
L_motorManager_UpdateManager18:
L_motorManager_UpdateManager16:
;motorManager.c,86 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,88 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager22:
;motorManager.c,89 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,90 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,91 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,92 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,94 :: 		if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager23
;motorManager.c,96 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,97 :: 		}
	GOTO       L_motorManager_UpdateManager24
L_motorManager_UpdateManager23:
;motorManager.c,98 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager25
;motorManager.c,100 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,101 :: 		}else if( (lineManager_GetState() == HALF_RIGHT) || (lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_RIGHT) ){
	GOTO       L_motorManager_UpdateManager26
L_motorManager_UpdateManager25:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager104
	GOTO       L_motorManager_UpdateManager29
L__motorManager_UpdateManager104:
;motorManager.c,102 :: 		motor_manager_state = LINE_LEFT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,103 :: 		}
L_motorManager_UpdateManager29:
L_motorManager_UpdateManager26:
L_motorManager_UpdateManager24:
;motorManager.c,105 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,107 :: 		case  BACKWARD:
L_motorManager_UpdateManager30:
;motorManager.c,114 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,116 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,118 :: 		case DELAY:
L_motorManager_UpdateManager31:
;motorManager.c,124 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,125 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,126 :: 		Delay_ms(500);
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
;motorManager.c,127 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,129 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,131 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager33:
;motorManager.c,133 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,134 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,135 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,136 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,139 :: 		if(inputManager_GetState() == BOTH_SIGHT && (lineManager_GetState() == NO_LINE))
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager36
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager36
L__motorManager_UpdateManager103:
;motorManager.c,141 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,142 :: 		}else if( (inputManager_GetState()) == BOTH_SIGHT && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	GOTO       L_motorManager_UpdateManager37
L_motorManager_UpdateManager36:
	CALL       _inputManager_GetState+0
;motorManager.c,143 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager42
;motorManager.c,142 :: 		}else if( (inputManager_GetState()) == BOTH_SIGHT && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager102
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager102
;motorManager.c,143 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager102
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager102
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager102
	GOTO       L_motorManager_UpdateManager42
L__motorManager_UpdateManager102:
L__motorManager_UpdateManager101:
;motorManager.c,145 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,146 :: 		}
	GOTO       L_motorManager_UpdateManager43
L_motorManager_UpdateManager42:
;motorManager.c,147 :: 		else if( (inputManager_GetState() == NO_SIGHT) && (lineManager_GetState() == NO_LINE) ){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager46
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager46
L__motorManager_UpdateManager100:
;motorManager.c,148 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,149 :: 		}else if(inputManager_GetState() == LEFT_SIGHT)
	GOTO       L_motorManager_UpdateManager47
L_motorManager_UpdateManager46:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager48
;motorManager.c,151 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,152 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager49
L_motorManager_UpdateManager48:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager50
;motorManager.c,154 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,155 :: 		}else if( (inputManager_GetState() == NO_SIGHT) && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	GOTO       L_motorManager_UpdateManager51
L_motorManager_UpdateManager50:
	CALL       _inputManager_GetState+0
;motorManager.c,156 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager56
;motorManager.c,155 :: 		}else if( (inputManager_GetState() == NO_SIGHT) && ((lineManager_GetState() == FULL) || (lineManager_GetState() == PARTIAL_LEFT)
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager99
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager99
;motorManager.c,156 :: 		|| (lineManager_GetState() == PARTIAL_RIGHT) || (lineManager_GetState() == HALF_LEFT) || (lineManager_GetState() == HALF_RIGHT)))
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager99
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager99
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager99
	GOTO       L_motorManager_UpdateManager56
L__motorManager_UpdateManager99:
L__motorManager_UpdateManager98:
;motorManager.c,158 :: 		motor_manager_state = LINE_BACKWARD;
	MOVLW      10
	MOVWF      _motor_manager_state+0
;motorManager.c,159 :: 		}
L_motorManager_UpdateManager56:
L_motorManager_UpdateManager51:
L_motorManager_UpdateManager49:
L_motorManager_UpdateManager47:
L_motorManager_UpdateManager43:
L_motorManager_UpdateManager37:
;motorManager.c,160 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,162 :: 		case LINE_LEFT:
L_motorManager_UpdateManager57:
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
L_motorManager_UpdateManager58:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager58
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager58
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager58
	NOP
;motorManager.c,171 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,173 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,175 :: 		case LINE_RIGHT:
L_motorManager_UpdateManager59:
;motorManager.c,176 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
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
L_motorManager_UpdateManager60:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager60
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager60
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager60
	NOP
;motorManager.c,183 :: 		motor_manager_state = LINE_FORWARD;
	MOVLW      9
	MOVWF      _motor_manager_state+0
;motorManager.c,185 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,187 :: 		case LINE_FORWARD:
L_motorManager_UpdateManager61:
;motorManager.c,189 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,190 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
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
L_motorManager_UpdateManager62:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager62
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager62
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager62
	NOP
	NOP
;motorManager.c,196 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,198 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,200 :: 		case LINE_BACKWARD:
L_motorManager_UpdateManager63:
;motorManager.c,202 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,203 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,204 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,205 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,207 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_motorManager_UpdateManager64:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager64
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager64
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager64
	NOP
	NOP
;motorManager.c,209 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,211 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,213 :: 		default:
L_motorManager_UpdateManager65:
;motorManager.c,214 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,216 :: 		}
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
	GOTO       L_motorManager_UpdateManager14
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager22
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager30
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager31
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager33
	MOVF       _motor_manager_state+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager57
	MOVF       _motor_manager_state+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager59
	MOVF       _motor_manager_state+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager61
	MOVF       _motor_manager_state+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager63
	GOTO       L_motorManager_UpdateManager65
L_motorManager_UpdateManager1:
;motorManager.c,217 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,219 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,221 :: 		switch(motor_manager_state)
	GOTO       L_motorManager_UpdateManager266
;motorManager.c,223 :: 		case MOTOR_INIT:
L_motorManager_UpdateManager268:
;motorManager.c,225 :: 		motor_manager_state =  MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,226 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,229 :: 		case MOTOR_STANDBY:
L_motorManager_UpdateManager269:
;motorManager.c,236 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,238 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager270
;motorManager.c,240 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,241 :: 		}else if((inputManager_GetState() == LEFT_SIGHT) || (inputManager_GetState() == NO_SIGHT) )
	GOTO       L_motorManager_UpdateManager271
L_motorManager_UpdateManager270:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager2108
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager2108
	GOTO       L_motorManager_UpdateManager274
L__motorManager_UpdateManager2108:
;motorManager.c,243 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,244 :: 		}
	GOTO       L_motorManager_UpdateManager275
L_motorManager_UpdateManager274:
;motorManager.c,245 :: 		else if(inputManager_GetState() == RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager276
;motorManager.c,247 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,248 :: 		}
L_motorManager_UpdateManager276:
L_motorManager_UpdateManager275:
L_motorManager_UpdateManager271:
;motorManager.c,251 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,253 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager277:
;motorManager.c,254 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,255 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,256 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,257 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,259 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager278
;motorManager.c,261 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,262 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager279
L_motorManager_UpdateManager278:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager280
;motorManager.c,264 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,265 :: 		}
L_motorManager_UpdateManager280:
L_motorManager_UpdateManager279:
;motorManager.c,267 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,269 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager281:
;motorManager.c,270 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,271 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,272 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,273 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,275 :: 		if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager282
;motorManager.c,277 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,278 :: 		}
	GOTO       L_motorManager_UpdateManager283
L_motorManager_UpdateManager282:
;motorManager.c,279 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager284
;motorManager.c,281 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,282 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager285
L_motorManager_UpdateManager284:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager286
;motorManager.c,284 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,285 :: 		}
L_motorManager_UpdateManager286:
L_motorManager_UpdateManager285:
L_motorManager_UpdateManager283:
;motorManager.c,287 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,289 :: 		case  BACKWARD:
L_motorManager_UpdateManager287:
;motorManager.c,296 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,298 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,300 :: 		case DELAY:
L_motorManager_UpdateManager288:
;motorManager.c,305 :: 		Delay_ms(500);
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
;motorManager.c,306 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,307 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,308 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_motorManager_UpdateManager290:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager290
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager290
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager290
	NOP
;motorManager.c,310 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,312 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,314 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager291:
;motorManager.c,316 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,317 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,318 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,319 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,321 :: 		if(inputManager_GetState() == NO_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager292
;motorManager.c,322 :: 		motor_manager_state = MOTOR_STANDBY;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,323 :: 		}
	GOTO       L_motorManager_UpdateManager293
L_motorManager_UpdateManager292:
;motorManager.c,324 :: 		else if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager294
;motorManager.c,326 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,327 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT)
	GOTO       L_motorManager_UpdateManager295
L_motorManager_UpdateManager294:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager296
;motorManager.c,329 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,330 :: 		}
L_motorManager_UpdateManager296:
L_motorManager_UpdateManager295:
L_motorManager_UpdateManager293:
;motorManager.c,331 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,332 :: 		default:
L_motorManager_UpdateManager297:
;motorManager.c,333 :: 		break;
	GOTO       L_motorManager_UpdateManager267
;motorManager.c,334 :: 		}
L_motorManager_UpdateManager266:
	MOVF       _motor_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager268
	MOVF       _motor_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager269
	MOVF       _motor_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager277
	MOVF       _motor_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager281
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager287
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager288
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager291
	GOTO       L_motorManager_UpdateManager297
L_motorManager_UpdateManager267:
;motorManager.c,336 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
