
UNKNOWN_C3E4EF: ;$C3E4EF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #$0000
	STA $0E
	BRA @UNKNOWN2
@UNKNOWN0:
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+window_stats::id,X
	CMP #$FFFF
	BNE @UNKNOWN1
	LDA $0E
	BRA @UNKNOWN3
@UNKNOWN1:
	LDA $0E
	INC
	STA $0E
@UNKNOWN2:
	CMP #$0008
	BNE @UNKNOWN0
	LDA #$FFFF
@UNKNOWN3:
	PLD
	RTL
