
EVENT_138: ;$C3C540
	EVENT_UNKNOWN_WRITE_121E .LOWORD(UNKNOWN_C0A37A)
	EVENT_SET_10F2 $00
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0C7DB
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_UNKNOWN_C0A8B3 $0000, $0008
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_5, $0018
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_6, $0002
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_137_138
	EVENT_UNKNOWN_C0A8FF
	EVENT_PAUSE 1*FRAME
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_138
	EVENT_SHORTJUMP .LOWORD(UNKNOWN_C3C506)
