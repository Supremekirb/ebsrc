
UNKNOWN_C193E7: ;$C193E7
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAX
	STX $12
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20A20
	JSR SET_INSTANT_PRINTING
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN28
	LOADPTR MISC_TARGET_TEXT, $06
	LDX $12
	TXA
	OPTIMIZED_MULT $04, 4
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA #$0004
	JSR PRINT_STRING
	JSR CLEAR_INSTANT_PRINTING
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20ABC
	PLD
	RTS
