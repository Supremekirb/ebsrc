
UNKNOWN_EFEA4A: ;$EFEA4A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	END_STACK_VARS
	JSL TEST_SRAM_SIZE
	CMP #$0000
	BEQ @INSUFFICIENT_SRAM
	LDA #$0001
	STA UNKNOWN_7EB567
	JSL LOAD_REPLAY_SAVE_SLOT
	LDA GAME_STATE+game_state::leader_x_coord
	STA @VIRTUAL04
	LDA GAME_STATE+game_state::leader_y_coord
	STA @VIRTUAL02
	LDX #$0001
	TXA
	JSL FADE_OUT
	LDX @VIRTUAL02
	LDA @VIRTUAL04
	JSL LOAD_MAP_AT_POSITION
	LDY #$0000
	LDX @VIRTUAL02
	LDA @VIRTUAL04
	JSL UNKNOWN_C03FA9
	JSL UNKNOWN_C09451
	LDX #$0000
	LDA UNKNOWN_7EB573
	JSL SCREEN_TRANSITION
	JSL UNKNOWN_C0943C
@INSUFFICIENT_SRAM:
	PLD
	RTL
