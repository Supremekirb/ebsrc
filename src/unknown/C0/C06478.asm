
UNKNOWN_C06478: ;$C06478
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDX .LOWORD(CURRENT_ENTITY_SLOT)
	STX $0E
	TXA
	ASL
	TAX
	LDA .LOWORD(ENTITY_COLLIDED_OBJECTS),X
	CMP #ENTITY_COLLISION_DISABLED
	BEQ @UNKNOWN0
	LDX $0E
	TXA
	JSL UNKNOWN_C09EFF_ENTRY2
	LDX $0E
	TXY
	LDX .LOWORD(UNKNOWN_7E284A)
	LDA .LOWORD(UNKNOWN_7E2848)
	JSL UNKNOWN_C06267
@UNKNOWN0:
	PLD
	RTL
