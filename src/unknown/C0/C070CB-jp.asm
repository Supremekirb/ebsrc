
UNKNOWN_C070CB: ;$C070CB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STY $02
	TXY
	STY $16
	STA $14
	LDA UNKNOWN_7E0081
	BNEL @UNKNOWN7
	JSL UNKNOWN_C48C69
	LDA $14
	TAX
	XBA
	AND #$00FF
	STA $04
	LDY $16
	TYA
	ASL
	ASL
	ASL
	TAY
	STY $16
	LDA $02
	ASL
	ASL
	ASL
	STA $02
	LDA GAME_STATE+game_state::walking_style
	BNEL @UNKNOWN4
	TXA
	JSR UNKNOWN_C0705F
	CMP #$0000
	BNEL @UNKNOWN7
	LDA UNKNOWN_7E5DCA
	STA GAME_STATE+game_state::leader_direction
	STZ UNKNOWN_7E5DB8
	LDA #$0003
	STA MISC_DEBUG_FLAGS
	LDA #$0001
	STA UNKNOWN_7E5DBA
	LDA $04
	XBA
	AND #$FF00
	STA UNKNOWN_7E5DC4
	LDA $04
	ASL
	TAX
	LDY $16
	TYA
	CLC
	ADC f:UNKNOWN_C3E210,X
	STA $14
	LDA $02
	CLC
	ADC f:UNKNOWN_C3E218,X
	STA $02
	STA $0E
	LDY $14
	LDX GAME_STATE+game_state::leader_y_coord
	LDA GAME_STATE+game_state::leader_x_coord
	JSL UNKNOWN_C48D58
	TAY
	STY $12
	BNE @UNKNOWN3
	INY
	STY $12
@UNKNOWN3:
	LDX #$0006
	STX $16
	LDA $04
	ASL
	TAX
	LDA f:UNKNOWN_C3E200,X
	LDX $16
	JSL UNKNOWN_C48E6B
	LOADPTR UNKNOWN_C06F82, $0E
	LDY $12
	TYA
	JSL SCHEDULE_OVERWORLD_TASK
	BRA @UNKNOWN6
@UNKNOWN4:
	LDA $04
	ASL
	TAX
	TYA
	CLC
	ADC f:UNKNOWN_C3E220,X
	STA $14
	LDA $02
	CLC
	ADC f:UNKNOWN_C3E228,X
	STA $02
	STA $0E
	LDY $14
	LDX GAME_STATE+game_state::leader_y_coord
	LDA GAME_STATE+game_state::leader_x_coord
	JSL UNKNOWN_C48D58
	TAY
	STY $12
	BNE @UNKNOWN5
	INY
	STY $12
@UNKNOWN5:
	LDX #$000C
	STX $16
	LDA $04
	ASL
	TAX
	LDA f:UNKNOWN_C3E208,X
	LDX $16
	JSL UNKNOWN_C48E6B
	LOADPTR UNKNOWN_C06FED, $0E
	LDY $12
	TYA
	JSL SCHEDULE_OVERWORLD_TASK
@UNKNOWN6:
	LDA $14
	STA UNKNOWN_7E5DCC
	LDA $02
	STA UNKNOWN_7E5DCE
	JSL UNKNOWN_C48E95
@UNKNOWN7:
	PLD
	RTS
