
UNKNOWN_C47333: ;$C47333
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA .LOWORD(GAME_STATE)+game_state::party_count
	AND #$00FF
	RTL
