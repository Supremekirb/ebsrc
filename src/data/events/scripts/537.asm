
EVENT_537: ;$C34F31
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C34E73)
	EVENT_UNKNOWN_C0A685 $40, $01
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_8, $0002
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $17A0
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1DA8
	EVENT_UNKNOWN_C0AACD
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $17D0
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1D78
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $17A0
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1DC0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $17E8
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1E08
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_9, $17E8
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_10, $1EA0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_EXEC_TEXT_BLOCK2 TEXT_EVENT_537
@UNKNOWN1: ;$C34F7E
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::UNKNOWN_002
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_WRITE_WORD_TEMPVAR $0006
	EVENT_UNKNOWN_C0A65F
	EVENT_SET_X_VELOCITY $FFFF
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C46E46
	EVENT_HALT
