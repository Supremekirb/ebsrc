
UNKNOWN_C496F9: ;$C496F9
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LDA #$0200
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $16
	LDA #$007E
	STA $18
	LOADPTR UNKNOWN_7F0000, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	LDA #$0200
	JSL MEMCPY24
	PLD
	RTL
