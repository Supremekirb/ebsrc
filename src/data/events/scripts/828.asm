
EVENT_828: ;$C36320
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C35FB6)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $000C
	EVENT_UNKNOWN_C0A685 $55, $01
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::LEFT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $CC*FRAMES
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
