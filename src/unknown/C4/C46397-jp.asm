
UNKNOWN_C46397: ;$C46397
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STA $02
	LDY #$0000
	STY $10
	BRA @UNKNOWN4
@UNKNOWN0:
	TYA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknown96,X
	AND #$00FF
	STA $04
	LDA #$0010
	CLC
	SBC $04
	BRANCHLTEQS @UNKNOWN3
	TYA
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknownA2,X
	STA $0E
	ASL
	CLC
	ADC #.LOWORD(ENTITY_DIRECTIONS)
	TAX
	LDA __BSS_START__,X
	CMP $02
	BEQ @UNKNOWN3
	LDA $02
	STA __BSS_START__,X
	LDA $0E
	JSL UNKNOWN_C0A780
@UNKNOWN3:
	LDY $10
	INY
	STY $10
@UNKNOWN4:
	LDA GAME_STATE+game_state::party_count
	AND #$00FF
	STA $04
	TYA
	CMP $04
	BCC @UNKNOWN0
	PLD
	RTL
