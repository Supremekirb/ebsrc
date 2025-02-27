
UNKNOWN_EF01D2: ;$EF01D2
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAX
	LDA $0E
	SEC
	SBC #$0050
	AND #$007F
	STA $0E
	LDA UNKNOWN_7E5E6D
	AND #$00FF
	STA $02
	MOVE_INT FONT_PTR_TABLE, $06
	LDA $0E
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	CLC
	ADC $02
	STA $0E
	LDA UNKNOWN_7E9E23
	AND #$0007
	STA $04
	LDA a:window_stats::text_x,X
	DEC
	ASL
	ASL
	ASL
	CLC
	ADC $04
	STA $02
	LDA $0E
	CLC
	ADC $02
	STA $02
	LDA a:window_stats::width,X
	ASL
	ASL
	ASL
	CMP $02
	BCS @UNKNOWN0
	JSL REDIRECT_PRINT_NEWLINE
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA UNKNOWN_7E5E75
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
