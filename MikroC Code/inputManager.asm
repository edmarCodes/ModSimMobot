
_inputManager_GetState:

;inputManager.c,6 :: 		input_manager_state_t inputManager_GetState(void)
;inputManager.c,8 :: 		return input_manager_state;
	MOVF       _input_manager_state+0, 0
	MOVWF      R0+0
;inputManager.c,9 :: 		}
L_end_inputManager_GetState:
	RETURN
; end of _inputManager_GetState

_inputManager_Init:

;inputManager.c,11 :: 		void inputManager_Init(void)
;inputManager.c,13 :: 		}
L_end_inputManager_Init:
	RETURN
; end of _inputManager_Init

_inputManager_UpdateManager2:

;inputManager.c,17 :: 		void inputManager_UpdateManager2(void)
;inputManager.c,20 :: 		if( inputManager_GetSensorBoolLeft())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager20
;inputManager.c,24 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,25 :: 		}
	GOTO       L_inputManager_UpdateManager21
L_inputManager_UpdateManager20:
;inputManager.c,28 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,29 :: 		}
L_inputManager_UpdateManager21:
;inputManager.c,32 :: 		if( inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager22
;inputManager.c,36 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,37 :: 		}
	GOTO       L_inputManager_UpdateManager23
L_inputManager_UpdateManager22:
;inputManager.c,40 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,41 :: 		}
L_inputManager_UpdateManager23:
;inputManager.c,44 :: 		}
L_end_inputManager_UpdateManager2:
	RETURN
; end of _inputManager_UpdateManager2

_inputManager_UpdateManager:

;inputManager.c,48 :: 		void inputManager_UpdateManager(void)
;inputManager.c,50 :: 		switch(input_manager_state)
	GOTO       L_inputManager_UpdateManager4
;inputManager.c,53 :: 		case NO_SIGHT:
L_inputManager_UpdateManager6:
;inputManager.c,55 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,56 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,58 :: 		if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager9
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager9
L__inputManager_UpdateManager61:
;inputManager.c,60 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,61 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,62 :: 		}
	GOTO       L_inputManager_UpdateManager10
L_inputManager_UpdateManager9:
;inputManager.c,63 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager13
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager13
L__inputManager_UpdateManager60:
;inputManager.c,65 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,66 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,67 :: 		}
L_inputManager_UpdateManager13:
L_inputManager_UpdateManager10:
;inputManager.c,68 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,70 :: 		case LEFT_SIGHT:
L_inputManager_UpdateManager14:
;inputManager.c,73 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager17
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager17
L__inputManager_UpdateManager59:
;inputManager.c,75 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,76 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,77 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,78 :: 		}
	GOTO       L_inputManager_UpdateManager18
L_inputManager_UpdateManager17:
;inputManager.c,79 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager21
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager21
L__inputManager_UpdateManager58:
;inputManager.c,81 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,82 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,83 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,84 :: 		}
	GOTO       L_inputManager_UpdateManager22
L_inputManager_UpdateManager21:
;inputManager.c,85 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager25
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager25
L__inputManager_UpdateManager57:
;inputManager.c,87 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,88 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,89 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,91 :: 		}
L_inputManager_UpdateManager25:
L_inputManager_UpdateManager22:
L_inputManager_UpdateManager18:
;inputManager.c,93 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,96 :: 		case RIGHT_SIGHT:
L_inputManager_UpdateManager26:
;inputManager.c,99 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager29
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager29
L__inputManager_UpdateManager56:
;inputManager.c,101 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,102 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,103 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,104 :: 		}
	GOTO       L_inputManager_UpdateManager30
L_inputManager_UpdateManager29:
;inputManager.c,105 :: 		else if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager33
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager33
L__inputManager_UpdateManager55:
;inputManager.c,107 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,108 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,109 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,110 :: 		}
	GOTO       L_inputManager_UpdateManager34
L_inputManager_UpdateManager33:
;inputManager.c,111 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager37
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager37
L__inputManager_UpdateManager54:
;inputManager.c,113 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,114 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,115 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,116 :: 		}
L_inputManager_UpdateManager37:
L_inputManager_UpdateManager34:
L_inputManager_UpdateManager30:
;inputManager.c,118 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,120 :: 		case BOTH_SIGHT:
L_inputManager_UpdateManager38:
;inputManager.c,122 :: 		if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager41
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager41
L__inputManager_UpdateManager53:
;inputManager.c,124 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,125 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,126 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,127 :: 		}
	GOTO       L_inputManager_UpdateManager42
L_inputManager_UpdateManager41:
;inputManager.c,128 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager45
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager45
L__inputManager_UpdateManager52:
;inputManager.c,130 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,131 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,132 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,133 :: 		}
	GOTO       L_inputManager_UpdateManager46
L_inputManager_UpdateManager45:
;inputManager.c,134 :: 		else if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager49
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager49
L__inputManager_UpdateManager51:
;inputManager.c,136 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,137 :: 		PORTB |= 0x02;
	BSF        PORTB+0, 1
;inputManager.c,138 :: 		PORTB |= 0x01;
	BSF        PORTB+0, 0
;inputManager.c,139 :: 		}
L_inputManager_UpdateManager49:
L_inputManager_UpdateManager46:
L_inputManager_UpdateManager42:
;inputManager.c,140 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,142 :: 		default:
L_inputManager_UpdateManager50:
;inputManager.c,143 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,144 :: 		PORTB &= ~0x02;
	BCF        PORTB+0, 1
;inputManager.c,145 :: 		PORTB &= ~0x01;
	BCF        PORTB+0, 0
;inputManager.c,146 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,147 :: 		}
L_inputManager_UpdateManager4:
	MOVF       _input_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager6
	MOVF       _input_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager14
	MOVF       _input_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager26
	MOVF       _input_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager38
	GOTO       L_inputManager_UpdateManager50
L_inputManager_UpdateManager5:
;inputManager.c,150 :: 		}
L_end_inputManager_UpdateManager:
	RETURN
; end of _inputManager_UpdateManager
