
UNKNOWN_C4B4BE: ;$C4B4BE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	CMP #$FFFF
	BEQ @UNKNOWN3
	ORA #$C000
	STA $02
	LDY #$0000
	STY $0E
	BRA @UNKNOWN2
@UNKNOWN0:
	TYA
	ASL
	CLC
	ADC #.LOWORD(ENTITY_DRAW_PRIORITY)
	TAX
	LDA __BSS_START__,X
	CMP $02
	BNE @UNKNOWN1
	LDA #$0000
	STA __BSS_START__,X
	TYA
	JSL UNKNOWN_C02140
@UNKNOWN1:
	LDY $0E
	INY
	STY $0E
@UNKNOWN2:
	CPY #$001E
	BCC @UNKNOWN0
@UNKNOWN3:
	PLD
	RTL
