
UNKNOWN_C191F8: ;$C191F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAY
	STY $0E
	TXA
	JSR UNKNOWN_C191B0
	TAX
	LDY $0E
	TYA
	JSL GIVE_ITEM_TO_CHARACTER
	LDY $0E
	TYA
	PLD
	RTS
