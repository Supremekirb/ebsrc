
UNKNOWN_C4C8A4: ;$C4C8A4
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	STZ .LOWORD(UNKNOWN_7EB4A4)
	STZ .LOWORD(UNKNOWN_7EB4A6)
	LOADPTR UNKNOWN_7F7C00, $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7EB4AA)
	MOVE_INT $06, $0E
	LDX #$0400
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL MEMSET24
	PLD
	RTS
