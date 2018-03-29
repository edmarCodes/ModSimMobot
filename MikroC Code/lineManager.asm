
_lineManager_GetState:

;lineManager.c,6 :: 		line_manager_state_t lineManager_GetState(void)
;lineManager.c,8 :: 		return line_manager_state;
	MOVF       _line_manager_state+0, 0
	MOVWF      R0+0
;lineManager.c,9 :: 		}
L_end_lineManager_GetState:
	RETURN
; end of _lineManager_GetState

_lineManager_Init:

;lineManager.c,11 :: 		void lineManager_Init(void)
;lineManager.c,13 :: 		}
L_end_lineManager_Init:
	RETURN
; end of _lineManager_Init

_lineManager_UpdateManager:

;lineManager.c,15 :: 		void lineManager_UpdateManager(void)
;lineManager.c,18 :: 		switch(line_manager_state)
	GOTO       L_lineManager_UpdateManager0
;lineManager.c,21 :: 		case NO_LINE:
L_lineManager_UpdateManager2:
;lineManager.c,23 :: 		if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager5
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager5
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager5
L__lineManager_UpdateManager152:
;lineManager.c,25 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,26 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager6
L_lineManager_UpdateManager5:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager9
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager9
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager9
L__lineManager_UpdateManager151:
;lineManager.c,28 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,29 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager10
L_lineManager_UpdateManager9:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager13
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager13
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager13
L__lineManager_UpdateManager150:
;lineManager.c,31 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,32 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager14
L_lineManager_UpdateManager13:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager17
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager17
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager17
L__lineManager_UpdateManager149:
;lineManager.c,34 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,35 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager18
L_lineManager_UpdateManager17:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager21
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager21
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager21
L__lineManager_UpdateManager148:
;lineManager.c,37 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,38 :: 		}
L_lineManager_UpdateManager21:
L_lineManager_UpdateManager18:
L_lineManager_UpdateManager14:
L_lineManager_UpdateManager10:
L_lineManager_UpdateManager6:
;lineManager.c,40 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,42 :: 		case PARTIAL_LEFT:
L_lineManager_UpdateManager22:
;lineManager.c,44 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager25
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager25
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager25
L__lineManager_UpdateManager147:
;lineManager.c,46 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,47 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager26
L_lineManager_UpdateManager25:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager29
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager29
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager29
L__lineManager_UpdateManager146:
;lineManager.c,49 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,50 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager30
L_lineManager_UpdateManager29:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager33
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager33
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager33
L__lineManager_UpdateManager145:
;lineManager.c,52 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,53 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager34
L_lineManager_UpdateManager33:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager37
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager37
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager37
L__lineManager_UpdateManager144:
;lineManager.c,55 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,56 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager38
L_lineManager_UpdateManager37:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager41
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager41
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager41
L__lineManager_UpdateManager143:
;lineManager.c,58 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,59 :: 		}
L_lineManager_UpdateManager41:
L_lineManager_UpdateManager38:
L_lineManager_UpdateManager34:
L_lineManager_UpdateManager30:
L_lineManager_UpdateManager26:
;lineManager.c,61 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,63 :: 		case PARTIAL_RIGHT:
L_lineManager_UpdateManager42:
;lineManager.c,65 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager45
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager45
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager45
L__lineManager_UpdateManager142:
;lineManager.c,67 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,68 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager46
L_lineManager_UpdateManager45:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager49
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager49
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager49
L__lineManager_UpdateManager141:
;lineManager.c,70 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,71 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager50
L_lineManager_UpdateManager49:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager53
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager53
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager53
L__lineManager_UpdateManager140:
;lineManager.c,73 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,74 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager54
L_lineManager_UpdateManager53:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager57
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager57
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager57
L__lineManager_UpdateManager139:
;lineManager.c,76 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,77 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager58
L_lineManager_UpdateManager57:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager61
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager61
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager61
L__lineManager_UpdateManager138:
;lineManager.c,79 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,80 :: 		}
L_lineManager_UpdateManager61:
L_lineManager_UpdateManager58:
L_lineManager_UpdateManager54:
L_lineManager_UpdateManager50:
L_lineManager_UpdateManager46:
;lineManager.c,82 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,84 :: 		case HALF_LEFT:
L_lineManager_UpdateManager62:
;lineManager.c,86 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager65
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager65
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager65
L__lineManager_UpdateManager137:
;lineManager.c,88 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,89 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager66
L_lineManager_UpdateManager65:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager69
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager69
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager69
L__lineManager_UpdateManager136:
;lineManager.c,91 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,92 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager70
L_lineManager_UpdateManager69:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager73
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager73
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager73
L__lineManager_UpdateManager135:
;lineManager.c,94 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,95 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager74
L_lineManager_UpdateManager73:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager77
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager77
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager77
L__lineManager_UpdateManager134:
;lineManager.c,97 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,98 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager78
L_lineManager_UpdateManager77:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager81
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager81
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager81
L__lineManager_UpdateManager133:
;lineManager.c,100 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,101 :: 		}
L_lineManager_UpdateManager81:
L_lineManager_UpdateManager78:
L_lineManager_UpdateManager74:
L_lineManager_UpdateManager70:
L_lineManager_UpdateManager66:
;lineManager.c,103 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,105 :: 		case HALF_RIGHT:
L_lineManager_UpdateManager82:
;lineManager.c,107 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager85
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager85
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager85
L__lineManager_UpdateManager132:
;lineManager.c,109 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,110 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager86
L_lineManager_UpdateManager85:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager89
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager89
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager89
L__lineManager_UpdateManager131:
;lineManager.c,112 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,113 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager90
L_lineManager_UpdateManager89:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager93
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager93
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager93
L__lineManager_UpdateManager130:
;lineManager.c,115 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,116 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager94
L_lineManager_UpdateManager93:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager97
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager97
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager97
L__lineManager_UpdateManager129:
;lineManager.c,118 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,119 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager98
L_lineManager_UpdateManager97:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager101
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager101
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager101
L__lineManager_UpdateManager128:
;lineManager.c,121 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,122 :: 		}
L_lineManager_UpdateManager101:
L_lineManager_UpdateManager98:
L_lineManager_UpdateManager94:
L_lineManager_UpdateManager90:
L_lineManager_UpdateManager86:
;lineManager.c,124 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,126 :: 		case FULL:
L_lineManager_UpdateManager102:
;lineManager.c,128 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager105
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager105
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager105
L__lineManager_UpdateManager127:
;lineManager.c,130 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,131 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager106
L_lineManager_UpdateManager105:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager109
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager109
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager109
L__lineManager_UpdateManager126:
;lineManager.c,133 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,134 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager110
L_lineManager_UpdateManager109:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager113
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager113
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager113
L__lineManager_UpdateManager125:
;lineManager.c,136 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,137 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager114
L_lineManager_UpdateManager113:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager117
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager117
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager117
L__lineManager_UpdateManager124:
;lineManager.c,139 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,140 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight())
	GOTO       L_lineManager_UpdateManager118
L_lineManager_UpdateManager117:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager121
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager121
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager121
L__lineManager_UpdateManager123:
;lineManager.c,142 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,143 :: 		}
L_lineManager_UpdateManager121:
L_lineManager_UpdateManager118:
L_lineManager_UpdateManager114:
L_lineManager_UpdateManager110:
L_lineManager_UpdateManager106:
;lineManager.c,145 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,147 :: 		default:
L_lineManager_UpdateManager122:
;lineManager.c,148 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,149 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,150 :: 		}
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
;lineManager.c,151 :: 		}
L_end_lineManager_UpdateManager:
	RETURN
; end of _lineManager_UpdateManager
