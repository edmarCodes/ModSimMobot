
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
;motorManager.c,37 :: 		motor_manager_state =  MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,38 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,41 :: 		case MOTOR_OFF:
L_motorManager_UpdateManager3:
;motorManager.c,43 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,44 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,45 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,46 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,48 :: 		if(inputManager_GetState() == LEFT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager4
;motorManager.c,50 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,51 :: 		}
	GOTO       L_motorManager_UpdateManager5
L_motorManager_UpdateManager4:
;motorManager.c,52 :: 		else if(inputManager_GetState() ==RIGHT_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager6
;motorManager.c,54 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,55 :: 		}
	GOTO       L_motorManager_UpdateManager7
L_motorManager_UpdateManager6:
;motorManager.c,56 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager8
;motorManager.c,58 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,59 :: 		}
L_motorManager_UpdateManager8:
L_motorManager_UpdateManager7:
L_motorManager_UpdateManager5:
;motorManager.c,62 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,64 :: 		case SLOW_LEFT:
L_motorManager_UpdateManager9:
;motorManager.c,65 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,66 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,67 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,68 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,70 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager10
;motorManager.c,72 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,73 :: 		}
	GOTO       L_motorManager_UpdateManager11
L_motorManager_UpdateManager10:
;motorManager.c,74 :: 		else if(inputManager_GetState() ==RIGHT_SIGHT || lineManager_GetState() == PARTIAL_LEFT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager65
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager65
	GOTO       L_motorManager_UpdateManager14
L__motorManager_UpdateManager65:
;motorManager.c,76 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,77 :: 		}
	GOTO       L_motorManager_UpdateManager15
L_motorManager_UpdateManager14:
;motorManager.c,78 :: 		else if(inputManager_GetState() == BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager16
;motorManager.c,80 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,81 :: 		}else if(lineManager_GetState() == HALF_LEFT || lineManager_GetState() == FULL){
	GOTO       L_motorManager_UpdateManager17
L_motorManager_UpdateManager16:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager64
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager64
	GOTO       L_motorManager_UpdateManager20
L__motorManager_UpdateManager64:
;motorManager.c,82 :: 		motor_manager_state = FAST_RIGHT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,83 :: 		}else if(lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL){
	GOTO       L_motorManager_UpdateManager21
L_motorManager_UpdateManager20:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager63
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager63
	GOTO       L_motorManager_UpdateManager24
L__motorManager_UpdateManager63:
;motorManager.c,84 :: 		motor_manager_state = FAST_LEFT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,85 :: 		}
L_motorManager_UpdateManager24:
L_motorManager_UpdateManager21:
L_motorManager_UpdateManager17:
L_motorManager_UpdateManager15:
L_motorManager_UpdateManager11:
;motorManager.c,86 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,88 :: 		case  SLOW_RIGHT:
L_motorManager_UpdateManager25:
;motorManager.c,89 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,90 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,91 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,92 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,94 :: 		if(inputManager_GetState() ==NO_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager26
;motorManager.c,96 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,97 :: 		}
	GOTO       L_motorManager_UpdateManager27
L_motorManager_UpdateManager26:
;motorManager.c,98 :: 		else if(inputManager_GetState() ==LEFT_SIGHT || lineManager_GetState() == PARTIAL_RIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager62
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager62
	GOTO       L_motorManager_UpdateManager30
L__motorManager_UpdateManager62:
;motorManager.c,100 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,101 :: 		}
	GOTO       L_motorManager_UpdateManager31
L_motorManager_UpdateManager30:
;motorManager.c,102 :: 		else if(inputManager_GetState() ==BOTH_SIGHT)
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager32
;motorManager.c,104 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,105 :: 		}else if(lineManager_GetState() == HALF_LEFT || lineManager_GetState() == FULL){
	GOTO       L_motorManager_UpdateManager33
L_motorManager_UpdateManager32:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager61
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager61
	GOTO       L_motorManager_UpdateManager36
L__motorManager_UpdateManager61:
;motorManager.c,106 :: 		motor_manager_state = FAST_RIGHT;
	MOVLW      7
	MOVWF      _motor_manager_state+0
;motorManager.c,107 :: 		}else if(lineManager_GetState() == HALF_RIGHT || lineManager_GetState() == FULL){
	GOTO       L_motorManager_UpdateManager37
L_motorManager_UpdateManager36:
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager60
	CALL       _lineManager_GetState+0
	MOVF       R0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__motorManager_UpdateManager60
	GOTO       L_motorManager_UpdateManager40
L__motorManager_UpdateManager60:
;motorManager.c,108 :: 		motor_manager_state = FAST_LEFT;
	MOVLW      8
	MOVWF      _motor_manager_state+0
;motorManager.c,109 :: 		}
L_motorManager_UpdateManager40:
L_motorManager_UpdateManager37:
L_motorManager_UpdateManager33:
L_motorManager_UpdateManager31:
L_motorManager_UpdateManager27:
;motorManager.c,113 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,115 :: 		case FAST_RIGHT:
L_motorManager_UpdateManager41:
;motorManager.c,117 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,118 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,119 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,120 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,122 :: 		if(inputManager_GetState() == LEFT_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager42
;motorManager.c,123 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,124 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT){
	GOTO       L_motorManager_UpdateManager43
L_motorManager_UpdateManager42:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager44
;motorManager.c,125 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,126 :: 		}else if(inputManager_GetState() == BOTH_SIGHT){
	GOTO       L_motorManager_UpdateManager45
L_motorManager_UpdateManager44:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager46
;motorManager.c,127 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,128 :: 		}
L_motorManager_UpdateManager46:
L_motorManager_UpdateManager45:
L_motorManager_UpdateManager43:
;motorManager.c,130 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,132 :: 		case FAST_LEFT:
L_motorManager_UpdateManager47:
;motorManager.c,134 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,135 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,136 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,137 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,139 :: 		if(inputManager_GetState() == LEFT_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager48
;motorManager.c,140 :: 		motor_manager_state = SLOW_LEFT;
	MOVLW      2
	MOVWF      _motor_manager_state+0
;motorManager.c,141 :: 		}else if(inputManager_GetState() == RIGHT_SIGHT){
	GOTO       L_motorManager_UpdateManager49
L_motorManager_UpdateManager48:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager50
;motorManager.c,142 :: 		motor_manager_state = SLOW_RIGHT;
	MOVLW      3
	MOVWF      _motor_manager_state+0
;motorManager.c,143 :: 		}else if(inputManager_GetState() == BOTH_SIGHT){
	GOTO       L_motorManager_UpdateManager51
L_motorManager_UpdateManager50:
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager52
;motorManager.c,144 :: 		motor_manager_state = BACKWARD;
	MOVLW      4
	MOVWF      _motor_manager_state+0
;motorManager.c,145 :: 		}
L_motorManager_UpdateManager52:
L_motorManager_UpdateManager51:
L_motorManager_UpdateManager49:
;motorManager.c,147 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,149 :: 		case  BACKWARD:
L_motorManager_UpdateManager53:
;motorManager.c,151 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,152 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,153 :: 		motorManager_MotorAMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,154 :: 		motorManager_MotorBMoveSlow();
	MOVLW      204
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,156 :: 		motor_manager_state = DELAY;
	MOVLW      5
	MOVWF      _motor_manager_state+0
;motorManager.c,158 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,160 :: 		case DELAY:
L_motorManager_UpdateManager54:
;motorManager.c,162 :: 		motorManager_MotorAMoveBackward();
	BCF        PORTB+0, 2
;motorManager.c,163 :: 		motorManager_MotorBMoveBackward();
	BCF        PORTB+0, 3
;motorManager.c,165 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_motorManager_UpdateManager55:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager55
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager55
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager55
	NOP
;motorManager.c,166 :: 		motorManager_MotorAOff();
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,167 :: 		motorManager_MotorBOff();
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,168 :: 		Delay_ms(1500);
	MOVLW      39
	MOVWF      R11+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_motorManager_UpdateManager56:
	DECFSZ     R13+0, 1
	GOTO       L_motorManager_UpdateManager56
	DECFSZ     R12+0, 1
	GOTO       L_motorManager_UpdateManager56
	DECFSZ     R11+0, 1
	GOTO       L_motorManager_UpdateManager56
	NOP
;motorManager.c,170 :: 		motor_manager_state = FAST_FORWARD;
	MOVLW      6
	MOVWF      _motor_manager_state+0
;motorManager.c,172 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,174 :: 		case FAST_FORWARD:
L_motorManager_UpdateManager57:
;motorManager.c,176 :: 		motorManager_MotorAMoveForward();
	BSF        PORTB+0, 2
;motorManager.c,177 :: 		motorManager_MotorBMoveForward();
	BSF        PORTB+0, 3
;motorManager.c,178 :: 		motorManager_MotorAMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motorManager.c,179 :: 		motorManager_MotorBMoveFast();
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;motorManager.c,181 :: 		if(inputManager_GetState() ==NO_SIGHT){
	CALL       _inputManager_GetState+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager58
;motorManager.c,182 :: 		motor_manager_state = MOTOR_OFF;
	MOVLW      1
	MOVWF      _motor_manager_state+0
;motorManager.c,183 :: 		}
L_motorManager_UpdateManager58:
;motorManager.c,185 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,187 :: 		default:
L_motorManager_UpdateManager59:
;motorManager.c,188 :: 		break;
	GOTO       L_motorManager_UpdateManager1
;motorManager.c,190 :: 		}
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
	GOTO       L_motorManager_UpdateManager25
	MOVF       _motor_manager_state+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager41
	MOVF       _motor_manager_state+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager47
	MOVF       _motor_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager53
	MOVF       _motor_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager54
	MOVF       _motor_manager_state+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_motorManager_UpdateManager57
	GOTO       L_motorManager_UpdateManager59
L_motorManager_UpdateManager1:
;motorManager.c,191 :: 		}
L_end_motorManager_UpdateManager:
	RETURN
; end of _motorManager_UpdateManager

_motorManager_UpdateManager2:

;motorManager.c,193 :: 		void motorManager_UpdateManager2(void)
;motorManager.c,238 :: 		}
L_end_motorManager_UpdateManager2:
	RETURN
; end of _motorManager_UpdateManager2
