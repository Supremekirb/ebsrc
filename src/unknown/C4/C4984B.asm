
UNKNOWN_C4984B: ;$C4984B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $0E
	LDY #$0340
	BRA @UNKNOWN1
@UNKNOWN0:
	TAX
	LDA a:.LOWORD(RAM),X
	EOR #$FFFF
	STA a:.LOWORD(RAM),X
	DEY
	LDA $0E
	INC
	INC
	STA $0E
@UNKNOWN1:
	CPY #$0000
	BNE @UNKNOWN0
	PLD
	RTS
