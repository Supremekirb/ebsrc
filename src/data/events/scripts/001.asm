
EVENT_1: ;$C3A043
	EVENT_SRAM_CHECK_ROUTINE_CHECKSUM
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_DISPLAY_ANTI_PIRACY_SCREEN
@UNKNOWN1:
	EVENT_SET_TICK_CALLBACK UNKNOWN_C05200
@UNKNOWN2:
	EVENT_LOOP $06
		EVENT_PAUSE $C8
	EVENT_LOOP_END
	EVENT_INFLICT_SUNSTROKE_CHECK
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN2)
