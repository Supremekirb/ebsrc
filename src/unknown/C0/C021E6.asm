
UNKNOWN_C021E6: ;$C021E6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	STZ .LOWORD(MAGIC_BUTTERFLY)
	STZ .LOWORD(UNKNOWN_7E4A68)
	STZ .LOWORD(OVERWORLD_ENEMY_COUNT)
	LDX #$0000
	STX $0E
	BRA @UNKNOWN2
@UNKNOWN0:
	TXA
	ASL
	TAX
	LDA .LOWORD(ENTITY_SCRIPT_TABLE),X
	INC
	CMP #$0002
	BLTEQ @UNKNOWN1
	LDX $0E
	CPX #$0017
	BEQ @UNKNOWN1
	TXA
	JSL UNKNOWN_C02140
@UNKNOWN1:
	LDX $0E
	INX
	STX $0E
@UNKNOWN2:
	CPX #$001E
	BNE @UNKNOWN0
	LDA #$0017
	JSL UNKNOWN_C09C35
	PLD
	RTL
