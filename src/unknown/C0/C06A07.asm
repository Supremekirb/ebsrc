
UNKNOWN_C06A07: ;$C06A07
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDX GAME_STATE+game_state::leader_y_coord
	LDA GAME_STATE+game_state::leader_x_coord
	JSL UNKNOWN_C068F4
	LDA UNKNOWN_7E5DD6
	JSL CHANGE_MUSIC
	RTL
