
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
L__inputManager_UpdateManager66:
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
L__inputManager_UpdateManager65:
;inputManager.c,76 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,77 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,78 :: 		}else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	GOTO       L_inputManager_UpdateManager14
L_inputManager_UpdateManager13:
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager17
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager17
L__inputManager_UpdateManager64:
;inputManager.c,80 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,81 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,82 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,83 :: 		}
L_inputManager_UpdateManager17:
L_inputManager_UpdateManager14:
L_inputManager_UpdateManager10:
;inputManager.c,84 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,86 :: 		case LEFT_SIGHT:
L_inputManager_UpdateManager18:
;inputManager.c,89 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager21
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager21
L__inputManager_UpdateManager63:
;inputManager.c,91 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,93 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,94 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,96 :: 		}
	GOTO       L_inputManager_UpdateManager22
L_inputManager_UpdateManager21:
;inputManager.c,97 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager25
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager25
L__inputManager_UpdateManager62:
;inputManager.c,99 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,101 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,102 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,104 :: 		}
	GOTO       L_inputManager_UpdateManager26
L_inputManager_UpdateManager25:
;inputManager.c,105 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager29
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager29
L__inputManager_UpdateManager61:
;inputManager.c,107 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,108 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,109 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,110 :: 		}
L_inputManager_UpdateManager29:
L_inputManager_UpdateManager26:
L_inputManager_UpdateManager22:
;inputManager.c,112 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,115 :: 		case RIGHT_SIGHT:
L_inputManager_UpdateManager30:
;inputManager.c,118 :: 		if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager33
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager33
L__inputManager_UpdateManager60:
;inputManager.c,120 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,121 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,122 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,123 :: 		}
	GOTO       L_inputManager_UpdateManager34
L_inputManager_UpdateManager33:
;inputManager.c,124 :: 		else if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager37
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager37
L__inputManager_UpdateManager59:
;inputManager.c,126 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,127 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,128 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,129 :: 		}
	GOTO       L_inputManager_UpdateManager38
L_inputManager_UpdateManager37:
;inputManager.c,130 :: 		else if(inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager41
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager41
L__inputManager_UpdateManager58:
;inputManager.c,132 :: 		input_manager_state = BOTH_SIGHT;
	MOVLW      3
	MOVWF      _input_manager_state+0
;inputManager.c,133 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,134 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,135 :: 		}
L_inputManager_UpdateManager41:
L_inputManager_UpdateManager38:
L_inputManager_UpdateManager34:
;inputManager.c,137 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,139 :: 		case BOTH_SIGHT:
L_inputManager_UpdateManager42:
;inputManager.c,141 :: 		if(inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSS      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager45
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager45
L__inputManager_UpdateManager57:
;inputManager.c,143 :: 		input_manager_state = LEFT_SIGHT;
	MOVLW      1
	MOVWF      _input_manager_state+0
;inputManager.c,144 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,145 :: 		inputManager_SensorAOn();
	BSF        PORTB+0, 0
;inputManager.c,146 :: 		}
	GOTO       L_inputManager_UpdateManager46
L_inputManager_UpdateManager45:
;inputManager.c,147 :: 		else if(!inputManager_GetSensorBoolLeft() && inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager49
	BTFSS      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager49
L__inputManager_UpdateManager56:
;inputManager.c,149 :: 		input_manager_state = RIGHT_SIGHT;
	MOVLW      2
	MOVWF      _input_manager_state+0
;inputManager.c,150 :: 		inputManager_SensorBOn();
	BSF        PORTB+0, 1
;inputManager.c,151 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,152 :: 		}
	GOTO       L_inputManager_UpdateManager50
L_inputManager_UpdateManager49:
;inputManager.c,153 :: 		else if(!inputManager_GetSensorBoolLeft() && !inputManager_GetSensorBoolRight())
	BTFSC      PORTB+0, 4
	GOTO       L_inputManager_UpdateManager53
	BTFSC      PORTB+0, 5
	GOTO       L_inputManager_UpdateManager53
L__inputManager_UpdateManager55:
;inputManager.c,155 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,156 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,157 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,158 :: 		}
L_inputManager_UpdateManager53:
L_inputManager_UpdateManager50:
L_inputManager_UpdateManager46:
;inputManager.c,159 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,161 :: 		default:
L_inputManager_UpdateManager54:
;inputManager.c,162 :: 		input_manager_state = NO_SIGHT;
	CLRF       _input_manager_state+0
;inputManager.c,163 :: 		inputManager_SensorBOff();
	BCF        PORTB+0, 1
;inputManager.c,164 :: 		inputManager_SensorAOff();
	BCF        PORTB+0, 0
;inputManager.c,165 :: 		break;
	GOTO       L_inputManager_UpdateManager5
;inputManager.c,166 :: 		}
L_inputManager_UpdateManager4:
	MOVF       _input_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager6
	MOVF       _input_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager18
	MOVF       _input_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager30
	MOVF       _input_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_inputManager_UpdateManager42
	GOTO       L_inputManager_UpdateManager54
L_inputManager_UpdateManager5:
;inputManager.c,169 :: 		}
L_end_inputManager_UpdateManager:
	RETURN
; end of _inputManager_UpdateManager
