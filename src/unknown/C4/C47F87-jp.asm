
UNKNOWN_C47F87: ;$C47F87
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA GAME_STATE+game_state::player_controlled_party_count
	AND #$00FF
	DEC
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::player_controlled_party_members,X
	AND #$00FF
	ASL
	TAX
	LDA CHOSEN_FOUR_PTRS,X
	TAX
	LDA __BSS_START__+13,X
	AND #$00FF
	TAX
	CPX #$0001
	BEQ @UNKNOWN0
	CPX #$0002
	BNE @UNKNOWN1
@UNKNOWN0:
	LDA UNKNOWN_7EB4B6
	BNE @UNKNOWN1
	LOADPTR TEXT_WINDOW_FLAVOUR_PALETTES+320, $0E
	LDX #$0040
	LDA #$0200
	JSL MEMCPY16
	BRA @UNKNOWN2
@UNKNOWN1:
	LOADPTR TEXT_WINDOW_FLAVOUR_PALETTES, $06
	LDA GAME_STATE+game_state::text_flavour
	AND #$00FF
	DEC
	OPTIMIZED_MULT $04, 3
	TAX
	LDA f:TEXT_WINDOW_PROPERTIES,X
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$0040
	LDA #$0200
	JSL MEMCPY16
@UNKNOWN2:
	STZ CUR_TEXT_PAL
	LDA #$0008
	JSL UNKNOWN_C0856B
	PLD
	RTL
