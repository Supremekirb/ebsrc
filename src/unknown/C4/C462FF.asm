
UNKNOWN_C462FF: ;$C462FF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STX $02
	TAX
	JSL UNKNOWN_C4605A
	STA $0E
	CMP #$FFFF
	BEQ @UNKNOWN0
	ASL
	CLC
	ADC #.LOWORD(ENTITY_DIRECTIONS)
	TAX
	LDA __BSS_START__,X
	CMP $02
	BEQ @UNKNOWN0
	LDA $02
	STA __BSS_START__,X
	LDA $0E
	JSL UNKNOWN_C0A443_ENTRY2
@UNKNOWN0:
	PLD
	RTL
