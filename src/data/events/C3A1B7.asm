
UNKNOWN_C3A1B7: ;$C3A1B7
	EVENT_PAUSE 3*TWENTIETHS_OF_A_SECOND
	EVENT_SET_ANIMATION $01
	EVENT_UNKNOWN_C0A443_ME1
	EVENT_PAUSE 3*TWENTIETHS_OF_A_SECOND
	EVENT_UNKNOWN_C40015
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(UNKNOWN_C3A1B7)
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
