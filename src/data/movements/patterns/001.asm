
MOVEMENT_1: ;$C3A043
	EBMOVE_CALLROUTINE SRAM_CHECK_ROUTINE_CHECKSUM
	EBMOVE_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EBMOVE_CALLROUTINE DISPLAY_ANTI_PIRACY_SCREEN
@UNKNOWN1:
	EBMOVE_UNKNOWN_08 UNKNOWN_C05200
@UNKNOWN2:
	EBMOVE_LOOP $06
	EBMOVE_PAUSE $C8
	EBMOVE_LOOP_END
	EBMOVE_CALLROUTINE INFLICT_SUNSTROKE_CHECK
	EBMOVE_SHORTJUMP .LOWORD(@UNKNOWN2)
