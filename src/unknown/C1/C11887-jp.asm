
UNKNOWN_C11887: ;$C11887
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	CMP #$FFFF
	BEQ @UNKNOWN2
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAY
	LDA $0E
	STA a:window_stats::selected_option,Y
	LDA a:window_stats::current_option,Y
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAX
	BRA @UNKNOWN1
@UNKNOWN0:
	DEC
	STA $0E
	LDA a:menu_option::next,X
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAX
@UNKNOWN1:
	LDA $0E
	BNE @UNKNOWN0
	LDA a:menu_option::page,X
	STA a:window_stats::menu_page_number,Y
@UNKNOWN2:
	JSR PRINT_MENU_ITEMS
	PLD
	RTS
