
UNKNOWN_C06F82: ;$C06F82
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA #$0000
	STA $12
	LDA .LOWORD(UNKNOWN_7E5DC4)
	BEQ @UNKNOWN0
	LDA .LOWORD(UNKNOWN_7E5DC4)
	CMP #$0100
	BNE @UNKNOWN1
@UNKNOWN0:
	LDA .LOWORD(UNKNOWN_7E5DCE)
	DEC
	CMP .LOWORD(GAME_STATE)+game_state::leader_y_coord
	BLTEQ @UNKNOWN2
	LDA #$0001
	STA $12
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA .LOWORD(UNKNOWN_7E5DCE)
	INC
	CMP .LOWORD(GAME_STATE)+game_state::leader_y_coord
	BCS @UNKNOWN2
	LDA #$0001
	STA $12
@UNKNOWN2:
	LDA $12
	BEQ @UNKNOWN3
	LDA #WALKING_STYLE::STAIRS
	STA .LOWORD(GAME_STATE)+game_state::walking_style
	LDA .LOWORD(UNKNOWN_7E5DCC)
	STA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	LDA .LOWORD(UNKNOWN_7E5DCE)
	STA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STZ .LOWORD(GAME_STATE) + game_state::unknown84
	STZ .LOWORD(GAME_STATE) + game_state::unknown80
	BRA @UNKNOWN4
@UNKNOWN3:
	LOADPTR UNKNOWN_C06F82, $0E
	LDA #$0001
	JSL SCHEDULE_OVERWORLD_TASK
@UNKNOWN4:
	PLD
	RTL
