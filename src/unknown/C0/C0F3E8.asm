
UNKNOWN_C0F3E8: ;$C0F3E8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LOADPTR GAS_STATION_PALETTE, $0E
	PROMOTENEARPTR $0200, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	JSL DECOMP
	LDA #$0018
	JSL UNKNOWN_C0856B
	PLD
	RTL
