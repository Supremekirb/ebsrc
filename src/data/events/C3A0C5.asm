
UNKNOWN_C3A0C5: ;$C3A0C5
	EVENT_PAUSE 1*FIFTH_OF_A_SECOND
	EVENT_SET_10F2 $01
	EVENT_UNKNOWN_C0A3A4_ME1
	EVENT_PAUSE 1*FIFTH_OF_A_SECOND
	EVENT_SET_10F2 $00
	EVENT_UNKNOWN_C0A3A4_ME3
	EVENT_SHORTJUMP .LOWORD(UNKNOWN_C3A0C5)
