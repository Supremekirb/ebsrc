
UNKNOWN_C46AAC: ;$C46AAC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA .LOWORD(UNKNOWN_7E1A42)
	ASL
	STA $12
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_10),X
	STA $0E
	LDA $12
	TAX
	LDY .LOWORD(UNKNOWN_30X2_TABLE_9),X
	TAX
	LDA .LOWORD(ENTITY_ABS_Y_TABLE),X
	TAX
	STX $10
	LDA $12
	TAX
	LDA .LOWORD(ENTITY_ABS_X_TABLE),X
	LDX $10
	JSL GET_DIRECTION_TO
	PLD
	RTL
