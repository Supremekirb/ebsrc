
UNKNOWN_C46363: ;$C46363
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STX $02
	TAX
	SEP #PROC_FLAGS::ACCUM8
	JSL UNKNOWN_C4608C
	STA $0E
	CMP #$00FF
	SBC $0A18F0,X
	CLC
	ADC #$00F6
	ROL
	TAX
	LDA a:.LOWORD(RAM),X
	CMP $02
	BEQ @UNKNOWN0
	LDA $02
	STA a:.LOWORD(RAM),X
	LDA $0E
	JSL UNKNOWN_C0A780
@UNKNOWN0:
	PLD
	RTL
