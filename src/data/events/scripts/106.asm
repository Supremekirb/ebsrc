
EVENT_106: ;$C3BCB0
	EVENT_UNKNOWN_C46C45
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_5, $0060
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_6, $0060
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3BD03)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB94)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_8, $0002
	EVENT_UNKNOWN_C0A943 $FF
	EVENT_ADD_9AF9 EVENT_9AF9_TABLE::UNKNOWN_10, $0020
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB44)
@UNKNOWN1: ;$C3BCD9
	EVENT_PAUSE 1*FRAME
	EVENT_UNKNOWN_C0A943 $FF
	EVENT_ADD_9AF9 EVENT_9AF9_TABLE::UNKNOWN_10, $0020
	EVENT_UNKNOWN_C0A8C6
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::UNKNOWN_13A
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_WRITE_WORD_TEMPVAR $1E00
	EVENT_UNKNOWN_C468B5
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_WRITE_WORD_TEMPVAR $0006
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_HALT
