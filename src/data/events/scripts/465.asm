
EVENT_465: ;$C33C6C
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48B3B
	EVENT_GET_POSITION_OF_PARTY_MEMBER $FF
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::UP
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $10*FRAMES
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1858
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1BC8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $00
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0000
	EVENT_START_TASK .LOWORD(UNKNOWN_C33DBE)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0008
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $17C0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1BC8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $17C0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1C00
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1858
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1C00
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_END_LAST_TASK
	EVENT_SET_VELOCITIES_ZERO
	EVENT_SET_X $1858
	EVENT_SET_Y $1C00
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
