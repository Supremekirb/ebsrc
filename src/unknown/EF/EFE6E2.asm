
UNKNOWN_EFE6E2: ;$EFE6E2
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0001
	BNE @UNKNOWN0
	LDA $0E
	CMP #$000A
	BLTEQ @UNKNOWN0
	LDA #$000A
	STA $0E
@UNKNOWN0:
	LDA $0E
	PLD
	RTL
