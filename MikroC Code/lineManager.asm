
_lineManager_GetState:

;lineManager.c,7 :: 		input_manager_state_t lineManager_GetState(void){
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

;lineManager.c,15 :: 		void lineManager_UpdateManager(void){
;lineManager.c,17 :: 		switch(line_manager_state){
	GOTO       L_lineManager_UpdateManager0
;lineManager.c,19 :: 		case NO_LINE:
L_lineManager_UpdateManager2:
;lineManager.c,21 :: 		if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager5
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager5
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager5
L__lineManager_UpdateManager152:
;lineManager.c,22 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,23 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager6
L_lineManager_UpdateManager5:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager9
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager9
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager9
L__lineManager_UpdateManager151:
;lineManager.c,24 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,25 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager10
L_lineManager_UpdateManager9:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager13
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager13
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager13
L__lineManager_UpdateManager150:
;lineManager.c,26 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,27 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager14
L_lineManager_UpdateManager13:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager17
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager17
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager17
L__lineManager_UpdateManager149:
;lineManager.c,28 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,29 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager18
L_lineManager_UpdateManager17:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager21
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager21
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager21
L__lineManager_UpdateManager148:
;lineManager.c,30 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,31 :: 		}
L_lineManager_UpdateManager21:
L_lineManager_UpdateManager18:
L_lineManager_UpdateManager14:
L_lineManager_UpdateManager10:
L_lineManager_UpdateManager6:
;lineManager.c,33 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,35 :: 		case PARTIAL_LEFT:
L_lineManager_UpdateManager22:
;lineManager.c,37 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager25
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager25
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager25
L__lineManager_UpdateManager147:
;lineManager.c,38 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,39 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager26
L_lineManager_UpdateManager25:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager29
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager29
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager29
L__lineManager_UpdateManager146:
;lineManager.c,40 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,41 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager30
L_lineManager_UpdateManager29:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager33
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager33
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager33
L__lineManager_UpdateManager145:
;lineManager.c,42 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,43 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager34
L_lineManager_UpdateManager33:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager37
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager37
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager37
L__lineManager_UpdateManager144:
;lineManager.c,44 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,45 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager38
L_lineManager_UpdateManager37:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager41
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager41
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager41
L__lineManager_UpdateManager143:
;lineManager.c,46 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,47 :: 		}
L_lineManager_UpdateManager41:
L_lineManager_UpdateManager38:
L_lineManager_UpdateManager34:
L_lineManager_UpdateManager30:
L_lineManager_UpdateManager26:
;lineManager.c,49 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,51 :: 		case PARTIAL_RIGHT:
L_lineManager_UpdateManager42:
;lineManager.c,53 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager45
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager45
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager45
L__lineManager_UpdateManager142:
;lineManager.c,54 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,55 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager46
L_lineManager_UpdateManager45:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager49
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager49
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager49
L__lineManager_UpdateManager141:
;lineManager.c,56 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,57 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager50
L_lineManager_UpdateManager49:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager53
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager53
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager53
L__lineManager_UpdateManager140:
;lineManager.c,58 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,59 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager54
L_lineManager_UpdateManager53:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager57
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager57
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager57
L__lineManager_UpdateManager139:
;lineManager.c,60 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,61 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager58
L_lineManager_UpdateManager57:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager61
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager61
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager61
L__lineManager_UpdateManager138:
;lineManager.c,62 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,63 :: 		}
L_lineManager_UpdateManager61:
L_lineManager_UpdateManager58:
L_lineManager_UpdateManager54:
L_lineManager_UpdateManager50:
L_lineManager_UpdateManager46:
;lineManager.c,65 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,67 :: 		case HALF_LEFT:
L_lineManager_UpdateManager62:
;lineManager.c,69 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager65
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager65
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager65
L__lineManager_UpdateManager137:
;lineManager.c,70 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,71 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager66
L_lineManager_UpdateManager65:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager69
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager69
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager69
L__lineManager_UpdateManager136:
;lineManager.c,72 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,73 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager70
L_lineManager_UpdateManager69:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager73
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager73
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager73
L__lineManager_UpdateManager135:
;lineManager.c,74 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,75 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager74
L_lineManager_UpdateManager73:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager77
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager77
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager77
L__lineManager_UpdateManager134:
;lineManager.c,76 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,77 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager78
L_lineManager_UpdateManager77:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager81
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager81
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager81
L__lineManager_UpdateManager133:
;lineManager.c,78 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,79 :: 		}
L_lineManager_UpdateManager81:
L_lineManager_UpdateManager78:
L_lineManager_UpdateManager74:
L_lineManager_UpdateManager70:
L_lineManager_UpdateManager66:
;lineManager.c,81 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,83 :: 		case HALF_RIGHT:
L_lineManager_UpdateManager82:
;lineManager.c,85 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager85
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager85
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager85
L__lineManager_UpdateManager132:
;lineManager.c,86 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,87 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager86
L_lineManager_UpdateManager85:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager89
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager89
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager89
L__lineManager_UpdateManager131:
;lineManager.c,88 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,89 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager90
L_lineManager_UpdateManager89:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager93
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager93
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager93
L__lineManager_UpdateManager130:
;lineManager.c,90 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,91 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager94
L_lineManager_UpdateManager93:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager97
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager97
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager97
L__lineManager_UpdateManager129:
;lineManager.c,92 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,93 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager98
L_lineManager_UpdateManager97:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager101
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager101
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager101
L__lineManager_UpdateManager128:
;lineManager.c,94 :: 		line_manager_state = FULL;
	MOVLW      5
	MOVWF      _line_manager_state+0
;lineManager.c,95 :: 		}
L_lineManager_UpdateManager101:
L_lineManager_UpdateManager98:
L_lineManager_UpdateManager94:
L_lineManager_UpdateManager90:
L_lineManager_UpdateManager86:
;lineManager.c,97 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,99 :: 		case FULL:
L_lineManager_UpdateManager102:
;lineManager.c,101 :: 		if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager105
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager105
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager105
L__lineManager_UpdateManager127:
;lineManager.c,102 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,103 :: 		}else if(lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager106
L_lineManager_UpdateManager105:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager109
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager109
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager109
L__lineManager_UpdateManager126:
;lineManager.c,104 :: 		line_manager_state = PARTIAL_LEFT;
	MOVLW      1
	MOVWF      _line_manager_state+0
;lineManager.c,105 :: 		}else if(!lineManager_GetLineBoolLeft() && !lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager110
L_lineManager_UpdateManager109:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager113
	BTFSC      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager113
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager113
L__lineManager_UpdateManager125:
;lineManager.c,106 :: 		line_manager_state = PARTIAL_RIGHT;
	MOVLW      2
	MOVWF      _line_manager_state+0
;lineManager.c,107 :: 		}else if(lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && !lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager114
L_lineManager_UpdateManager113:
	BTFSS      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager117
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager117
	BTFSC      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager117
L__lineManager_UpdateManager124:
;lineManager.c,108 :: 		line_manager_state = HALF_LEFT;
	MOVLW      3
	MOVWF      _line_manager_state+0
;lineManager.c,109 :: 		}else if(!lineManager_GetLineBoolLeft() && lineManager_GetLineBoolMiddle() && lineManager_GetLineBoolRight()){
	GOTO       L_lineManager_UpdateManager118
L_lineManager_UpdateManager117:
	BTFSC      PORTB+0, 6
	GOTO       L_lineManager_UpdateManager121
	BTFSS      PORTB+0, 7
	GOTO       L_lineManager_UpdateManager121
	BTFSS      PORTB+0, 5
	GOTO       L_lineManager_UpdateManager121
L__lineManager_UpdateManager123:
;lineManager.c,110 :: 		line_manager_state = HALF_RIGHT;
	MOVLW      4
	MOVWF      _line_manager_state+0
;lineManager.c,111 :: 		}
L_lineManager_UpdateManager121:
L_lineManager_UpdateManager118:
L_lineManager_UpdateManager114:
L_lineManager_UpdateManager110:
L_lineManager_UpdateManager106:
;lineManager.c,113 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,115 :: 		default:
L_lineManager_UpdateManager122:
;lineManager.c,116 :: 		line_manager_state = NO_LINE;
	CLRF       _line_manager_state+0
;lineManager.c,117 :: 		break;
	GOTO       L_lineManager_UpdateManager1
;lineManager.c,118 :: 		}
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
;lineManager.c,119 :: 		}
L_end_lineManager_UpdateManager:
	RETURN
; end of _lineManager_UpdateManager
