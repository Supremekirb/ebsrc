
UNKNOWN_C43D24: ;$C43D24
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 17
	JSL REDIRECT_C438A5
	LDA .LOWORD(UNKNOWN_7E5E71)+1
	AND #$00FF
	BEQ @UNKNOWN0
	LDA .LOWORD(UNKNOWN_7E5E71)+1
	AND #$00FF
	CLC
	ADC .LOWORD(UNKNOWN_7E9E23)
	STA .LOWORD(UNKNOWN_7E9E23)
	LDA .LOWORD(UNKNOWN_7E9E25)
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7E3492)
	STA $0F
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0020
	REP #PROC_FLAGS::ACCUM8
	LDA $0F
	JSL MEMSET16
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7E5E71)+1
	STA .LOWORD(UNKNOWN_7E5E73)
	STZ .LOWORD(UNKNOWN_7E5E71)+1
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
