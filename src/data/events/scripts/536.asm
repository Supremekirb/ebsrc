
EVENT_536: ;$C34EC8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C34E73)
	EVENT_UNKNOWN_C0A685 $40, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1760
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2188
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PAUSE 1*SECOND
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1768
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2190
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1760
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2198
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1708
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2198
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $16F0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2198
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $16E8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2190
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $16F0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2188
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $78*FRAMES
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
