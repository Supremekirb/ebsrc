
INIT_BATTLE_COMMON: ;$C052AA
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDY #$0000
	LDX #$0001
	TXA
	JSL FADE_OUT_WITH_MOSAIC
	JSL BATTLE_ROUTINE
	STA $0E
	JSL UPDATE_PARTY
	LDA #$0001
	STA UNKNOWN_7E4DC4
	STZ BATTLE_DEBUG
	LDA $0E
	PLD
	RTL
