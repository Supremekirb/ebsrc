
UNKNOWN_C0DC38: ;$C0DC38
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 14
	OPTIMIZED_MULT $04, 6
	TAX
	STZ .LOWORD(OVERWORLD_TASKS),X
	PLD
	RTL
