
EVENT_535: ;$C34E85
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C34E73)
	EVENT_UNKNOWN_C0A685 $40, $01
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_8, $0002
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $1D60
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $0B40
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_DECOMP_ITOI_PRODUCTION
	EVENT_WRITE_BYTE_WRAM $001A, $17
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $1D30
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $0B70
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $1C70
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $0B70
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_EXEC_TEXT_BLOCK2 TEXT_EVENT_535
	EVENT_UNKNOWN_C46E46
	EVENT_HALT
