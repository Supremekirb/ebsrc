
GET_CHARACTER_ITEM: ;$C3E977
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_RETURN_INT16
	END_STACK_VARS
	TXY
	TAX
	TYA
	DEC
	STA @VIRTUAL02
	TXA
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC @VIRTUAL02
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	PLD
	RTL
