
EVENT_494: ;$C341A7
	EVENT_UNKNOWN_C0A86F $00FC
	EVENT_SET_Y_RELATIVE $0020
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AAAA)
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0A443_ME2
UNKNOWN_C341BE: ;$C341BE
	EVENT_UNKNOWN_C0A86F $00FC
	EVENT_SET_Y_RELATIVE $0020
	EVENT_PAUSE 1*FRAME
	EVENT_SHORTJUMP .LOWORD(UNKNOWN_C341BE)
