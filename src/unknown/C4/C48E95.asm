
UNKNOWN_C48E95: ;$C48E95
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA .LOWORD(UNKNOWN_7E9F18)
	INC
	STA .LOWORD(UNKNOWN_7E9F18)
	OPTIMIZED_MULT $04, 3
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9E58),X
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E9E58)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSL UNKNOWN_C0402B
	PLD
	RTL
