
UNKNOWN_C0C711: ;$C0C711
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA CURRENT_ENTITY_SLOT
	ASL
	TAX
	STX $0E
	LDA ENTITY_SIZES,X
	ASL
	TAY
	LDA ENTITY_SCREEN_X_TABLE,X
	TYX
	SEC
	SBC f:UNKNOWN_C42A1F,X
	STA $04
	LDX $0E
	LDA ENTITY_SCREEN_Y_TABLE,X
	STA $0E
	TYX
	SEC
	SBC f:UNKNOWN_C42A41,X
	STA $02
	LDA $0E
	CLC
	ADC #$0008
	PHA
	LDA $04
	ORA $04
	ORA $02
	PLY
	STY $02
	ORA $02
	AND #$FF00
	BEQ @UNKNOWN0
	LDA #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA #$FFFF
@UNKNOWN1:
	PLD
	RTL
