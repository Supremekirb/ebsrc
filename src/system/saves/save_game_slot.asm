
SAVE_GAME_SLOT: ;$EF0A4D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	ASL
	TAX
	STX $0E
	TXA
	JSR SAVE_GAME_BLOCK
	LDX $0E
	TXA
	INC
	JSR SAVE_GAME_BLOCK
	PLD
	RTL
