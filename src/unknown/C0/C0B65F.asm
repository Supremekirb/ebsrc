
UNKNOWN_C0B65F: ;$C0B65F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	TXY
	TAX
	STX GAME_STATE+game_state::leader_x_coord
	STY GAME_STATE+game_state::leader_y_coord
	LDA #$0002
	STA GAME_STATE+game_state::leader_direction
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA GAME_STATE + game_state::party_members
	STX ENTITY_SCREEN_X_TABLE + (PARTY_LEADER_ENTITY_INDEX * 2)
	STY ENTITY_SCREEN_Y_TABLE + (PARTY_LEADER_ENTITY_INDEX * 2)
	REP #PROC_FLAGS::ACCUM8
	RTL
