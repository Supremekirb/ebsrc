
UNKNOWN_C09ECE: ;$C09ECE
	JSR a:.LOWORD(UNKNOWN_C09D8D)
	TAX
	JSR a:.LOWORD(UNKNOWN_C09D99)
	PHA
	JSR a:.LOWORD(UNKNOWN_C09D8D)
	STY $94
	TAY
	PLA
	JMP INIT_ENTITY_UNKNOWN2
	LDX .LOWORD(UNKNOWN_7E1A44)
	BRA @UNKNOWN0
	LDX $88
	BRA @UNKNOWN0
	ASL
	TAX
@UNKNOWN0:
	LDY #$0000
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(ENTITY_SCREEN_X_TABLE)+1,X
	BNE @UNKNOWN1
	LDA .LOWORD(ENTITY_SCREEN_Y_TABLE)+1,X
	BNE @UNKNOWN1
	DEY
@UNKNOWN1:
	REP #PROC_FLAGS::ACCUM8
	TYA
	RTL
