
UNKNOWN_C46712: ;$C46712
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA GAME_STATE + game_state::unknownA2
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA __BSS_START__,X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA __BSS_START__,X
	LDA #$0001
	STA $0E
	BRA @UNKNOWN1
@UNKNOWN0:
	ASL
	TAX
	LDA GAME_STATE + game_state::unknownA2,X
	ASL
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA __BSS_START__,X
	ORA #$8000
	STA __BSS_START__,X
	LDA $0E
	INC
	STA $0E
@UNKNOWN1:
	LDA GAME_STATE+game_state::party_count
	AND #$00FF
	STA $02
	LDA $0E
	CMP $02
	BCC @UNKNOWN0
	PLD
	RTL
