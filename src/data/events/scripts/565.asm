
EVENT_565: ;$C34BCD
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0001
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0A443_ME2
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::UP
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0A443_ME2
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
	EVENT_HALT
