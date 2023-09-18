
UNKNOWN_C1F497: ;$C1F497
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	TAX
	STX $16
	LDA #$0018
	STA CURRENT_FOCUS_WINDOW
	JSL SET_INSTANT_PRINTING
	LDX $16
	BEQL @UNKNOWN3
	JSL OPEN_TEXT_SPEED_MENU
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+window_stats::current_option,X
	LDY #.SIZEOF(menu_option)
	JSL MULT168
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAY
	STY $14
	LDA GAME_STATE+game_state::text_speed
	AND #$00FF
	TAX
	DEX
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA __BSS_START__+2,Y
	LDY #.SIZEOF(menu_option)
	JSL MULT168
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAY
	STY $14
	DEX
@UNKNOWN2:
	BNE @UNKNOWN1
	LDA #$0006
	JSR UNKNOWN_C10FEA
	LDY $14
	LDA __BSS_START__+10,Y
	TAX
	LDA __BSS_START__+8,Y
	INC
	JSL UNKNOWN_C438A5
	LDY $14
	TYA
	CLC
	ADC #$0013
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #$0001
	LDA #$FFFF
	JSL UNKNOWN_C43BB9
	LDA #$0000
	JSR UNKNOWN_C10FEA
	LDA GAME_STATE+game_state::text_speed
	AND #$00FF
	TAX
	STX $12
	BRA @UNKNOWN4
@UNKNOWN3:
	STZ UNKNOWN_7E5E6E
	LDA #$0001
	JSR SELECTION_MENU
	TAX
	STX $12
	BEQ @UNKNOWN4
	TXA
	SEP #PROC_FLAGS::ACCUM8
	STA GAME_STATE+game_state::text_speed
	REP #PROC_FLAGS::ACCUM8
	LDA CURRENT_SAVE_SLOT
	AND #$00FF
	DEC
	JSL SAVE_GAME_SLOT
@UNKNOWN4:
	LDX $12
	TXA
	PLD
	RTL
