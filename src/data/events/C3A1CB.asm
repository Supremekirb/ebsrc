
UNKNOWN_C3A1CB: ;$C3A1CB
	EVENT_PAUSE $06*FRAMES
	EVENT_SET_10F2 $01
	EVENT_UNKNOWN_C0A3A4_ME1
	EVENT_PAUSE $06*FRAMES
	EVENT_UNKNOWN_C40015
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(UNKNOWN_C3A1CB)
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
