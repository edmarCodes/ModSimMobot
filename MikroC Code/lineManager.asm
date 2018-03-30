
_lineManager_GetState:

;lineManager.c,11 :: 		line_manager_state_t lineManager_GetState(void)
;lineManager.c,13 :: 		return line_manager_state;
	MOVF       _line_manager_state+0, 0
	MOVWF      R0+0
;lineManager.c,14 :: 		}
L_end_lineManager_GetState:
	RETURN
; end of _lineManager_GetState

_lineManager_Init:

;lineManager.c,20 :: 		void lineManager_Init(void)
;lineManager.c,22 :: 		}
L_end_lineManager_Init:
	RETURN
; end of _lineManager_Init

_lineManager_UpdateManager:

;lineManager.c,28 :: 		void lineManager_UpdateManager(void)
;lineManager.c,31 :: 		switch(line_manager_state)
	GOTO       L_lineManager_UpdateManager0
;lineManager.c,34 :: 		case NO_LINE:
L_lineManager_UpdateManager2:
;lineManager.c,36 :: 		if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager5
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager5
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager5
L__lineManager_UpdateManager152:
;lineManager.c,38 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,39 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager6
L_lineManager_UpdateManager5:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager9
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager9
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager9
L__lineManager_UpdateManager151:
;lineManager.c,41 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,42 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager10
L_lineManager_UpdateManager9:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager13
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager13
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager13
L__lineManager_UpdateManager150:
;lineManager.c,44 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,45 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager14
L_lineManager_UpdateManager13:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager17
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager17
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager17
L__lineManager_UpdateManager149:
;lineManager.c,47 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,48 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager18
L_lineManager_UpdateManager17:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager21
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager21
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager21
L__lineManager_UpdateManager148:
;lineManager.c,50 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,51 :: 		}
L_lineManager_UpdateManager21:
L_lineManager_UpdateManager18:
L_lineManager_UpdateManager14:
L_lineManager_UpdateManager10:
L_lineManager_UpdateManager6:
;lineManager.c,53 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,55 :: 		case PARTIAL_LEFT:
L_lineManager_UpdateManager22:
;lineManager.c,57 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager25
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager25
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager25
L__lineManager_UpdateManager147:
;lineManager.c,59 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,60 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager26
L_lineManager_UpdateManager25:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager29
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager29
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager29
L__lineManager_UpdateManager146:
;lineManager.c,62 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,63 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager30
L_lineManager_UpdateManager29:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager33
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager33
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager33
L__lineManager_UpdateManager145:
;lineManager.c,65 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,66 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager34
L_lineManager_UpdateManager33:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager37
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager37
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager37
L__lineManager_UpdateManager144:
;lineManager.c,68 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,69 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager38
L_lineManager_UpdateManager37:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager41
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager41
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager41
L__lineManager_UpdateManager143:
;lineManager.c,71 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,72 :: 		}
L_lineManager_UpdateManager41:
L_lineManager_UpdateManager38:
L_lineManager_UpdateManager34:
L_lineManager_UpdateManager30:
L_lineManager_UpdateManager26:
;lineManager.c,74 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,76 :: 		case PARTIAL_RIGHT:
L_lineManager_UpdateManager42:
;lineManager.c,78 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager45
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager45
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager45
L__lineManager_UpdateManager142:
;lineManager.c,80 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,81 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager46
L_lineManager_UpdateManager45:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager49
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager49
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager49
L__lineManager_UpdateManager141:
;lineManager.c,83 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,84 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager50
L_lineManager_UpdateManager49:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager53
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager53
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager53
L__lineManager_UpdateManager140:
;lineManager.c,86 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,87 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager54
L_lineManager_UpdateManager53:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager57
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager57
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager57
L__lineManager_UpdateManager139:
;lineManager.c,89 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,90 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager58
L_lineManager_UpdateManager57:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager61
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager61
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager61
L__lineManager_UpdateManager138:
;lineManager.c,92 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,93 :: 		}
L_lineManager_UpdateManager61:
L_lineManager_UpdateManager58:
L_lineManager_UpdateManager54:
L_lineManager_UpdateManager50:
L_lineManager_UpdateManager46:
;lineManager.c,95 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,97 :: 		case HALF_LEFT:
L_lineManager_UpdateManager62:
;lineManager.c,99 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager65
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager65
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager65
L__lineManager_UpdateManager137:
;lineManager.c,101 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,102 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager66
L_lineManager_UpdateManager65:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager69
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager69
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager69
L__lineManager_UpdateManager136:
;lineManager.c,104 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,105 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager70
L_lineManager_UpdateManager69:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager73
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager73
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager73
L__lineManager_UpdateManager135:
;lineManager.c,107 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,108 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager74
L_lineManager_UpdateManager73:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager77
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager77
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager77
L__lineManager_UpdateManager134:
;lineManager.c,110 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,111 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager78
L_lineManager_UpdateManager77:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager81
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager81
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager81
L__lineManager_UpdateManager133:
;lineManager.c,113 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,114 :: 		}
L_lineManager_UpdateManager81:
L_lineManager_UpdateManager78:
L_lineManager_UpdateManager74:
L_lineManager_UpdateManager70:
L_lineManager_UpdateManager66:
;lineManager.c,116 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,118 :: 		case HALF_RIGHT:
L_lineManager_UpdateManager82:
;lineManager.c,120 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager85
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager85
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager85
L__lineManager_UpdateManager132:
;lineManager.c,122 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,123 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager86
L_lineManager_UpdateManager85:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager89
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager89
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager89
L__lineManager_UpdateManager131:
;lineManager.c,125 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,126 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager90
L_lineManager_UpdateManager89:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager93
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager93
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager93
L__lineManager_UpdateManager130:
;lineManager.c,128 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,129 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager94
L_lineManager_UpdateManager93:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager97
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager97
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager97
L__lineManager_UpdateManager129:
;lineManager.c,131 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,132 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager98
L_lineManager_UpdateManager97:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager101
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager101
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager101
L__lineManager_UpdateManager128:
;lineManager.c,134 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,135 :: 		}
L_lineManager_UpdateManager101:
L_lineManager_UpdateManager98:
L_lineManager_UpdateManager94:
L_lineManager_UpdateManager90:
L_lineManager_UpdateManager86:
;lineManager.c,137 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,139 :: 		case FULL:
L_lineManager_UpdateManager102:
;lineManager.c,141 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager105
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager105
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager105
L__lineManager_UpdateManager127:
;lineManager.c,143 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,144 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager106
L_lineManager_UpdateManager105:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager109
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager109
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager109
L__lineManager_UpdateManager126:
;lineManager.c,146 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,147 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager110
L_lineManager_UpdateManager109:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager113
	BTFSS      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager113
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager113
L__lineManager_UpdateManager125:
;lineManager.c,149 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,150 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager114
L_lineManager_UpdateManager113:
	BTFSC      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager117
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager117
	BTFSS      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager117
L__lineManager_UpdateManager124:
;lineManager.c,152 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,153 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager118
L_lineManager_UpdateManager117:
	BTFSS      PORTD+0, 5
	GOTO       L_lineManager_UpdateManager121
	BTFSC      PORTD+0, 6
	GOTO       L_lineManager_UpdateManager121
	BTFSC      PORTD+0, 7
	GOTO       L_lineManager_UpdateManager121
L__lineManager_UpdateManager123:
;lineManager.c,155 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,156 :: 		}
L_lineManager_UpdateManager121:
L_lineManager_UpdateManager118:
L_lineManager_UpdateManager114:
L_lineManager_UpdateManager110:
L_lineManager_UpdateManager106:
;lineManager.c,158 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,160 :: 		default:
L_lineManager_UpdateManager122:
;lineManager.c,161 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,162 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,163 :: 		}
L_lineManager_UpdateManager0:
	MOVF       _line_manager_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager2
	MOVF       _line_manager_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager22
	MOVF       _line_manager_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager42
	MOVF       _line_manager_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager62
	MOVF       _line_manager_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager82
	MOVF       _line_manager_state+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_lineManager_UpdateManager102
	GOTO       L_lineManager_UpdateManager122
L_lineManager_UpdateManager1:
;lineManager.c,164 :: 		}
L_end_lineManager_UpdateManager:
	RETURN
; end of _lineManager_UpdateManager
