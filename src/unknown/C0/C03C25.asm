
UNKNOWN_C03C25: ;$C03C25
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #$0001
	STA UNKNOWN_7E5DDA
	LDX GAME_STATE+game_state::leader_y_coord
	LDA GAME_STATE+game_state::leader_x_coord
	JSL UNKNOWN_C068F4
	LDA UNKNOWN_7E5DD6
	CMP UNKNOWN_7E5DD4
	BEQ @UNKNOWN0
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL UNKNOWN_C069AF
@UNKNOWN0:
	STZ UNKNOWN_7E5DDA
	RTS
