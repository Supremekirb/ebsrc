
UNKNOWN_C3EAD0: ;$C3EAD0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	LDX #$0000
	STX $0E
	BRA @UNKNOWN2
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	CMP $00
	BNE @UNKNOWN1
	LDX $0E
	REP #PROC_FLAGS::ACCUM8
	TXA
	JSL IS_VALID_ITEM_TRANSFORMATION
	CMP #$0000
	BNE @UNKNOWN3
	LDX $0E
	TXA
	JSL INITIALIZE_ITEM_TRANSFORMATION
	BRA @UNKNOWN3
@UNKNOWN1:
	LDX $0E
	INX
	STX $0E
@UNKNOWN2:
	REP #PROC_FLAGS::ACCUM8
	TXA
	OPTIMIZED_MULT $04, 5
	TAX
	LDA f:TIMED_ITEM_TRANSFORMATION_TABLE,X
	AND #$00FF
	BNE @UNKNOWN0
@UNKNOWN3:
	PLD
	RTL
