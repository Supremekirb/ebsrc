
UNKNOWN_C23008: ;$C23008
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDX #.LOWORD(GAME_STATE) + game_state::party_npc_1
	STX $0E
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA GAME_STATE+game_state::party_npc_1_id_copy
	REP #PROC_FLAGS::ACCUM8
	LDA GAME_STATE+game_state::party_npc_1_hp
	STA GAME_STATE + game_state::party_npc_1_hp_copy
	LDY #.LOWORD(GAME_STATE) + game_state::party_npc_2
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,Y
	STA GAME_STATE + game_state::party_npc_2_id_copy
	REP #PROC_FLAGS::ACCUM8
	LDA GAME_STATE+game_state::party_npc_2_hp
	STA GAME_STATE + game_state::party_npc_2_hp_copy
	LDA __BSS_START__,Y
	AND #$00FF
	JSL REMOVE_CHAR_FROM_PARTY
	LDX $0E
	LDA __BSS_START__,X
	AND #$00FF
	JSL REMOVE_CHAR_FROM_PARTY
	LDY #.LOWORD(GAME_STATE) + game_state::money_carried
	MOVE_INT_YPTRSRC __BSS_START__, $06
	MOVE_INT $06, GAME_STATE+game_state::wallet_backup
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT_YPTRDEST $06, __BSS_START__
	PLD
	RTL
