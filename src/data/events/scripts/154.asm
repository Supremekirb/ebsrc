
EVENT_154: ;$C3CA3E
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_UNKNOWN_C0A679 $00
	EVENT_UNKNOWN_WRITE_11A6 .LOWORD(UNKNOWN_C0A03A)
	EVENT_UNKNOWN_WRITE_121E .LOWORD(UNKNOWN_C0A00C)
	EVENT_SET_Z $00C0
	EVENT_SET_10F2 $00
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_UNKNOWN_C0A685 $00, $03
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_8, $0003
	EVENT_WRITE_WORD_TEMPVAR $0002
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_SET_Z_VELOCITY $FF00
	EVENT_PAUSE $80*FRAMES
	EVENT_SET_Z_VELOCITY $0000
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $0CC0
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1028
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $00, $03
	EVENT_WRITE_WORD_TEMPVAR $0002
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_SET_Z_VELOCITY $0100
	EVENT_PAUSE $80*FRAMES
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
