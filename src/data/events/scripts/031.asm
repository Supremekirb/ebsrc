
EVENT_31: ;$C3A9DA
	EVENT_UNKNOWN_C0A651 $04
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3A426)
	EVENT_UNKNOWN_C0A6B8
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(UNKNOWN_C3A47C)
	EVENT_UNKNOWN_C0A685 $10, $02
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_3, $0004
EVENT_31_ENTRY_2: ;$C3A9F3
	EVENT_UNKNOWN_C0C48F
	EVENT_PAUSE 2*FIFTEENTHS_OF_A_SECOND
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(EVENT_31_ENTRY_2)
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN2)
@UNKNOWN1: ;$C3A9FF
	EVENT_UNKNOWN_C0C48F
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(EVENT_31_ENTRY_2)
@UNKNOWN2: ;$C3AA06
	EVENT_UNKNOWN_C46B65
	EVENT_UNKNOWN_C0C62B
	EVENT_UNKNOWN_C47044
	EVENT_UNKNOWN_C46B0A
	EVENT_PAUSE 1*SECOND
	EVENT_SET_VELOCITIES_ZERO
	EVENT_PAUSE 1*FIFTH_OF_A_SECOND
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN1)
