
EVENT_45: ;$C3AF0F
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AAB8)
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_3, $1E70
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_4, $0150
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_5, $0010
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_6, $0010
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_45
	EVENT_PAUSE 1*FRAME
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_8, $0011
	EVENT_UNKNOWN_C0A943 $FF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C46E46
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_7, $0001
	EVENT_HALT
