
EVENT_556: ;$C3486A
	EVENT_SET_PRIORITY $00
	EVENT_SET_X $0200
	EVENT_SET_Y $1D88
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_UNKNOWN_C0A685 $C0, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $01A0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1D88
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $80, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0188
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1D98
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0180
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1DA8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $40, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0180
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1DC8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PAUSE 1*HALF_OF_A_SECOND
	EVENT_YIELD_TO_TEXT
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
