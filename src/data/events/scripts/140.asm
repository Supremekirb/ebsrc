
EVENT_140: ;$C3C5C6
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_WRITE_WORD_TO_9AF9_ENTRY EVENT_9AF9_TABLE::UNKNOWN_7, $0001
	EVENT_LOOP $05
		EVENT_LOOP $3C
			EVENT_UNKNOWN_C468A9
			EVENT_AND_TEMPVAR $00A0
			EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN1)
			EVENT_PAUSE 1*FRAME
		EVENT_LOOP_END
	EVENT_LOOP_END
	EVENT_UNKNOWN_C46E46
	EVENT_HALT
@UNKNOWN1: ;$C3C5E5
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::UNKNOWN_009
	EVENT_UNKNOWN_C46E46
	EVENT_HALT
