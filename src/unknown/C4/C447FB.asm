
UNKNOWN_C447FB: ;$C447FB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	TAY
	STY $16
	MOVE_INT $26, $06
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAX
	STX $14
	MOVE_INT $06, $0E
	LDY $16
	TYA
	JSL UNKNOWN_C43E31
	STA $12
	LDA .LOWORD(UNKNOWN_7E9E23)
	AND #$0007
	STA $04
	LDX $14
	LDA a:.LOWORD(RAM) + window_stats::text_x,X
	DEC
	ASL
	ASL
	ASL
	CLC
	ADC $04
	STA $02
	LDA $12
	CLC
	ADC $02
	STA $02
	LDA a:.LOWORD(RAM) + window_stats::width,X
	ASL
	ASL
	ASL
	CMP $02
	BCS @UNKNOWN0
	JSL REDIRECT_C438B1
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5E75)
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY $16
	TYA
	JSL REDIRECT_DISPLAY_CONFIG_MENU_TITLE
	PLD
	RTL
