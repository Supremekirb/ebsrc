
UNKNOWN_C1FF2C: ;$C1FF2C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA GAME_STATE+game_state::player_controlled_party_count
	AND #$00FF
	TAX
	DEX
	LDA GAME_STATE+game_state::player_controlled_party_members,X
	AND #$00FF
	ASL
	TAX
	LDA CHOSEN_FOUR_PTRS,X
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__+14,X
	LDX #$0000
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN0
	CMP #$0002
	BNE @UNKNOWN1
@UNKNOWN0:
	LDX #$0001
@UNKNOWN1:
	LDA #$0000
	CPX UNKNOWN_7EB4A2
	BEQ @UNKNOWN2
	LDA #$0001
@UNKNOWN2:
	STX UNKNOWN_7EB4A2
	RTS
