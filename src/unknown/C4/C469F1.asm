
UNKNOWN_C469F1: ;$C469F1
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TAX
	LDY .LOWORD(UNKNOWN_7E1A42)
	STY $10
	TXA
	JSL UNKNOWN_C46028
	STA $04
	CMP #$FFFF
	BEQ @UNKNOWN0
	LDA $04
	ASL
	STA $02
	LDY $10
	TYA
	ASL
	TAX
	LDA .LOWORD(SPRITE_ABS_Y_TABLE),X
	STA $0E
	LDY .LOWORD(SPRITE_ABS_X_TABLE),X
	LDX $02
	LDA .LOWORD(SPRITE_ABS_Y_TABLE),X
	TAX
	STX $10
	LDX $02
	LDA .LOWORD(SPRITE_ABS_X_TABLE),X
	LDX $10
	JSL UNKNOWN_C41EFF
	LDY #$2000
	CLC
	ADC #$1000
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $10
	LDA $02
	CLC
	ADC #$2AF6
	TAX
	LDA $10
	STA $02
	LDA a:.LOWORD(RAM),X
	CMP $02
	BEQ @UNKNOWN0
	LDA $10
	STA a:.LOWORD(RAM),X
	LDA $04
	JSL UNKNOWN_C0A3A4_ENTRY2
@UNKNOWN0:
	PLD
	RTL
