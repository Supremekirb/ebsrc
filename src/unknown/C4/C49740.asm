
UNKNOWN_C49740: ;$C49740
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	PROMOTENEARPTR $0200, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $16
	LDA #$007E
	STA $18
	MOVE_INT $16, $06
	MOVE_INT $06, $0E
	LOADPTR UNKNOWN_7F0000, $12
	LDA #$0200
	JSL MEMCPY24
	LDA #$0018
	JSL UNKNOWN_C0856B
	PLD
	RTL
