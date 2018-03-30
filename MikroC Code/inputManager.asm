
_inputManager_GetState:

;inputManager.c,12 :: 		input_manager_state_t inputManager_GetState(void)
;inputManager.c,14 :: 		return input_manager_state;
	MOVF       _input_manager_state+0, 0
	MOVWF      R0+0
;inputManager.c,15 :: 		}
L_end_inputManager_GetState:
	RETURN
; end of _inputManager_GetState

_inputManager_Init:

;inputManager.c,21 :: 		void inputManager_Init(void)
;inputManager.c,23 :: 		}
L_end_inputManager_Init:
	RETURN
; end of _inputManager_Init

_inputManager_UpdateManager2:

;inputManager.c,29 :: 		void inputManager_UpdateManager2(void)
;inputManager.c,32 :: 		if( inputManager_GetSensorBoolLeft())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager20
;inputManager.c,34 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,35 :: 		}
	GOTO       L_inputManager_UpdateManager21
L_inputManager_UpdateManager20:
;inputManager.c,38 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,39 :: 		}
L_inputManager_UpdateManager21:
;inputManager.c,42 :: 		if( inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager22
;inputManager.c,44 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,45 :: 		}
	GOTO       L_inputManager_UpdateManager23
L_inputManager_UpdateManager22:
;inputManager.c,48 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,49 :: 		}
L_inputManager_UpdateManager23:
;inputManager.c,52 :: 		}
L_end_inputManager_UpdateManager2:
	RETURN
; end of _inputManager_UpdateManager2

_inputManager_UpdateManager:

;inputManager.c,59 :: 		void inputManager_UpdateManager(void)
;inputManager.c,61 :: 		switch(input_manager_state)
	GOTO       L_inputManager_UpdateManager4
;inputManager.c,64 :: 		case NO_SIGHT:
L_inputManager_UpdateManager6:
;inputManager.c,66 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,67 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,69 :: 		if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager9
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager9
L__inputManager_UpdateManager61:
;inputManager.c,71 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,72 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,73 :: 		}
	GOTO       L_inputManager_UpdateManager10
L_inputManager_UpdateManager9:
;inputManager.c,74 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager13
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager13
L__inputManager_UpdateManager60:
;inputManager.c,76 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,77 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,78 :: 		}
L_inputManager_UpdateManager13:
L_inputManager_UpdateManager10:
;inputManager.c,79 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,81 :: 		case LEFT_SIGHT:
L_inputManager_UpdateManager14:
;inputManager.c,84 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager17
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager17
L__inputManager_UpdateManager59:
;inputManager.c,86 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,88 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,89 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,91 :: 		}
	GOTO       L_inputManager_UpdateManager18
L_inputManager_UpdateManager17:
;inputManager.c,92 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager21
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager21
L__inputManager_UpdateManager58:
;inputManager.c,94 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,96 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,97 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,99 :: 		}
	GOTO       L_inputManager_UpdateManager22
L_inputManager_UpdateManager21:
;inputManager.c,100 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager25
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager25
L__inputManager_UpdateManager57:
;inputManager.c,102 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,103 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,104 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,106 :: 		}
L_inputManager_UpdateManager25:
L_inputManager_UpdateManager22:
L_inputManager_UpdateManager18:
;inputManager.c,108 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,111 :: 		case RIGHT_SIGHT:
L_inputManager_UpdateManager26:
;inputManager.c,114 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager29
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager29
L__inputManager_UpdateManager56:
;inputManager.c,116 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,117 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,118 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,119 :: 		}
	GOTO       L_inputManager_UpdateManager30
L_inputManager_UpdateManager29:
;inputManager.c,120 :: 		else if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager33
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager33
L__inputManager_UpdateManager55:
;inputManager.c,122 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,123 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,124 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,125 :: 		}
	GOTO       L_inputManager_UpdateManager34
L_inputManager_UpdateManager33:
;inputManager.c,126 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager37
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager37
L__inputManager_UpdateManager54:
;inputManager.c,128 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,129 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,130 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,131 :: 		}
L_inputManager_UpdateManager37:
L_inputManager_UpdateManager34:
L_inputManager_UpdateManager30:
;inputManager.c,133 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,135 :: 		case BOTH_SIGHT:
L_inputManager_UpdateManager38:
;inputManager.c,137 :: 		if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager41
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager41
L__inputManager_UpdateManager53:
;inputManager.c,139 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,140 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,141 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,142 :: 		}
	GOTO       L_inputManager_UpdateManager42
L_inputManager_UpdateManager41:
;inputManager.c,143 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager45
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager45
L__inputManager_UpdateManager52:
;inputManager.c,145 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,146 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,147 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,148 :: 		}
	GOTO       L_inputManager_UpdateManager46
L_inputManager_UpdateManager45:
;inputManager.c,149 :: 		else if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager49
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager49
L__inputManager_UpdateManager51:
;inputManager.c,151 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,152 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,153 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,154 :: 		}
L_inputManager_UpdateManager49:
L_inputManager_UpdateManager46:
L_inputManager_UpdateManager42:
;inputManager.c,155 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,157 :: 		default:
L_inputManager_UpdateManager50:
;inputManager.c,158 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,159 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,160 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,161 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,162 :: 		}
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
;inputManager.c,165 :: 		}
L_end_inputManager_UpdateManager:
	RETURN
; end of _inputManager_UpdateManager
