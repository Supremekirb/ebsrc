
UNKNOWN_C0ECB7: ;$C0ECB7
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	SEP #PROC_FLAGS::ACCUM8
	STZ a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	LOADPTR TITLE_SCREEN_PALETTE, $0E
	PROMOTENEARPTR $0200, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	JSL DECOMP
	JSL UNKNOWN_C496F9
	SEP #PROC_FLAGS::ACCUM8
	STZ $0E
	LDX #$0100
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	LDX #$00FF
	LDA #$00A5
	JSL UNKNOWN_C496E7
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
