
UNKNOWN_C46E4F: ;$C46E4F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STX $14
	STA $12
	STA $06
	LDA $14
	STA $08
	MOVE_INT $06, $0E
	LDA #$0008
	JSL UNKNOWN_C064E3
	PLD
	RTL
