
UNKNOWN_C042EF: ;$C042EF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STA $1A
	ASL
	TAX
	LDA f:UNKNOWN_C3E148,X
	STA $18
	LDA f:UNKNOWN_C3E158,X
	STA $16
	LDA GAME_STATE+game_state::leader_x_coord
	CLC
	ADC $18
	STA $14
	LDA GAME_STATE+game_state::leader_y_coord
	CLC
	ADC $16
	STA $04
	LDA UNKNOWN_7E5D58
	STA $12
	LDA #$0001
	STA UNKNOWN_7E5D58
@UNKNOWN0:
	LDA #.LOWORD(GAME_STATE) + game_state::current_party_members
	STA $02
	LDX $02
	LDA __BSS_START__,X
	TAY
	LDX $04
	LDA $14
	JSL NPC_COLLISION_CHECK
	STA $10
	CMP #$8000
	BCS @UNKNOWN1
	ASL
	TAX
	LDA ENTITY_TPT_ENTRIES,X
	STA CURRENT_TPT_ENTRY
	LDA $10
	STA UNKNOWN_7E5D64
	BRA @UNKNOWN7
@UNKNOWN1:
	LDA $1A
	STA $0E
	LDX $02
	LDA __BSS_START__,X
	TAY
	LDX $04
	LDA $14
	JSL UNKNOWN_C05CD7
	AND #$0082
	CMP #$0082
	BNE @UNKNOWN7
	LDA $18
	BEQ @UNKNOWN4
	LDA $18
	AND #$8000
	BEQ @UNKNOWN2
	LDX #$FFF8
	BRA @UNKNOWN3
@UNKNOWN2:
	LDX #$0008
@UNKNOWN3:
	TXA
	CLC
	ADC $14
	STA $14
@UNKNOWN4:
	LDA $16
	BEQ @UNKNOWN0
	LDA $16
	AND #$8000
	BEQ @UNKNOWN5
	LDX #$FFF8
	BRA @UNKNOWN6
@UNKNOWN5:
	LDX #$0008
@UNKNOWN6:
	STX $02
	LDA $04
	CLC
	ADC $02
	STA $04
	JMP @UNKNOWN0
@UNKNOWN7:
	LDA $12
	STA UNKNOWN_7E5D58
	LDA CURRENT_TPT_ENTRY
	BEQ @UNKNOWN8
	LDA CURRENT_TPT_ENTRY
	CMP #$FFFF
	BNE @UNKNOWN9
@UNKNOWN8:
	LDA $1A
	JSL UNKNOWN_C065C2
@UNKNOWN9:
	LDA CURRENT_TPT_ENTRY
	PLD
	RTS
