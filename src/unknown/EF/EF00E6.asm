
UNKNOWN_EF00E6: ;$EF00E6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 14
	STY $02
	TXY
	TAX
	LDA __BSS_START__,X
	AND #$03FF
	ORA $02
	STA __BSS_START__,X
	TYA
	ASL
	STA $04
	TXA
	CLC
	ADC $04
	TAX
	LDA __BSS_START__,X
	AND #$03FF
	ORA $02
	STA __BSS_START__,X
	PLD
	RTL
