
UNKNOWN_C0E815: ;$C0E815
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LDA TELEPORT_STYLE
	CMP #TELEPORT_STYLE::INSTANT
	BEQ @UNKNOWN2
	LDA #$0018
	STA $18
	BRA @UNKNOWN1
@UNKNOWN0:
	ASL
	TAX
	LDA #ENTITY_COLLISION_DISABLED
	STA ENTITY_COLLIDED_OBJECTS,X
	LDA $18
	INC
	STA $18
@UNKNOWN1:
	CMP #$001E
	BCC @UNKNOWN0
	LDY #.LOWORD(UNKNOWN_7E9F4D) + 2
	STY $16
	LDA #$0000
	STA __BSS_START__,Y
	LDX #.LOWORD(UNKNOWN_7E9F49) + 2
	STX $18
	STA __BSS_START__,X
	LOADPTR UNKNOWN_C0E674, $0E
	LOADPTR UNKNOWN_C0E3C1, $12
	LDA #$0017
	JSL SET_PARTY_TICK_CALLBACKS
	LDX $18
	LDA __BSS_START__,X
	STA UNKNOWN_7E9F59
	LDA GAME_STATE+game_state::leader_x_coord
	STA UNKNOWN_7E9F5B
	LDY $16
	LDA __BSS_START__,Y
	STA UNKNOWN_7E9F5D
	LDA GAME_STATE+game_state::leader_y_coord
	STA UNKNOWN_7E9F5F
	LDX #$0004
	LDA #$0001
	JSL FADE_OUT
	JSR UNKNOWN_C0DD0F
@UNKNOWN2:
	PLD
	RTS
