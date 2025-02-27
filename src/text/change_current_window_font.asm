
CHANGE_CURRENT_WINDOW_FONT: ;$C10FAC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LDA CURRENT_FOCUS_WINDOW
	CMP #$FFFF
	BEQ @RETURN
	LDA $0E
	CMP #$0030
	BNE @LOAD_MR_SATURN_FONT_ID
	LDA #$0000
	STA $0E
	BRA @SKIP_MR_SATURN_FONT_ID
@LOAD_MR_SATURN_FONT_ID:
	LDA #$0001
	STA $0E
@SKIP_MR_SATURN_FONT_ID:
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA $0E
	STA WINDOW_STATS_TABLE+window_stats::font,X
@RETURN:
	PLD
	RTS
