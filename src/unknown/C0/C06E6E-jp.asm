
UNKNOWN_C06E6E: ;$C06E6E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	STY $1C
	STX $1A
	STA $18
	LDA a:.LOWORD(UNKNOWN_7E0081)
	BEQ @UNKNOWN0
	JMP @UNKNOWN4
@UNKNOWN0:
	JSL UNKNOWN_C48C69
	LDX $1A
	TXA
	ASL
	ASL
	ASL
	TAX
	STX $16
	LDY $1C
	TYA
	ASL
	ASL
	ASL
	STA $14
	LDA $18
	AND #$8000
	BEQ @UNKNOWN2
	LDY #.LOWORD(GAME_STATE) + game_state::walking_style
	LDA a:.LOWORD(RAM),Y
	CMP #$000C
	BEQ @UNKNOWN1
	JMP @UNKNOWN4
@UNKNOWN1:
	LDA #$0000
	STA a:.LOWORD(RAM),Y
	LDA #$0003
	STA .LOWORD(MISC_DEBUG_FLAGS)
	LDA .LOWORD(UNKNOWN_7E5DC6)
	XBA
	AND #$00FF
	ASL
	STA $02
	TXA
	LDX $02
	CLC
	ADC f:UNKNOWN_C06E02+8,X
	STA $04
	LDA $14
	STA $0E
	LDY $04
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL UNKNOWN_C48D58
	TAY
	STY $12
	LDX #$0010
	STX $1A
	LDX $02
	LDA f:UNKNOWN_C06E02+16,X
	LDX $1A
	JSL UNKNOWN_C48E6B
	LOADPTR UNKNOWN_C06E4A, $0E
	LDY $12
	TYA
	INC
	JSL UNKNOWN_C0DBE6
	JSL UNKNOWN_C48E95
	STZ .LOWORD(UNKNOWN_7E5DC6)
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5DBA)
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA .LOWORD(GAME_STATE)+game_state::walking_style
	CMP #WALKING_STYLE::ESCALATOR
	BEQ @UNKNOWN4
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5DBA)
	LDA $18
	STA .LOWORD(UNKNOWN_7E5DC6)
	XBA
	AND #$00FF
	ASL
	STA $1C
	TAX
	LDA f:UNKNOWN_C06E02+16,X
	STA .LOWORD(GAME_STATE)+game_state::leader_direction
	LDA #$0003
	STA .LOWORD(MISC_DEBUG_FLAGS)
	LDA $1C
	PHA
	LDX $16
	TXA
	PLX
	CLC
	ADC f:UNKNOWN_C06E02,X
	STA $04
	LDA $14
	STA $0E
	LDY $04
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL UNKNOWN_C48D58
	TAX
	LOADPTR UNKNOWN_C06E2C, $0E
	TXA
	INC
	JSL UNKNOWN_C0DBE6
	JSL UNKNOWN_C48E95
@UNKNOWN3:
	LDA $04
	STA.LOWORD(UNKNOWN_7E5DD0)
	LDA $14
	STA .LOWORD(UNKNOWN_7E5DD2)
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E5DC4)
@UNKNOWN4:
	PLD
	RTS
