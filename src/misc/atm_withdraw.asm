
WITHDRAW_FROM_ATM: ;$C228B7
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT32
	END_STACK_VARS
	MOVE_INT @PARAM00, $0A
	LDY #.LOWORD(GAME_STATE) + game_state::bank_balance
	MOVE_INT_YPTRSRC __BSS_START__, $06
	CLC
	LDA $0A
	SBC $06
	LDA $0C
	SBC $08
	BCS WITHDRAW_FROM_ATM_INSUFFICIENT_FUNDS
	SEC
	SUB_INT_ASSIGN $06, $0A
	MOVE_INT_YPTRDEST $06, __BSS_START__
WITHDRAW_FROM_ATM_INSUFFICIENT_FUNDS:
	PLD
	RTL
