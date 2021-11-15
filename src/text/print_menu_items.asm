
PRINT_MENU_ITEMS: ;$C1163C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 23
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BEQL @UNKNOWN13
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	STA $04
	LDX $04
	LDA a:window_stats::current_option,X
	CMP #$FFFF
	BNE @UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA .LOWORD(UNKNOWN_7E968C)
	JMP @UNKNOWN13
@UNKNOWN1:
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	.A16
	CLC
	ADC #.LOWORD(UNKNOWN_7E89D4)
	STA $02
	JSL SET_9622_ONE
@UNKNOWN2:
	LDX $02
	LDA a:.LOWORD(RAM)+6,X
	LDX $04
	CMP a:window_stats::menu_page_number,X
	BEQ @UNKNOWN3
	CMP #$0000
	BNEL @UNKNOWN12
@UNKNOWN3:
	LDA $02
	JSL UNKNOWN_C43DDB
	LDX $02
	LDA a:.LOWORD(RAM)+6,X
	BNEL @UNKNOWN11
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	LDA #$014F
	JSL UNKNOWN_C43F77
	JSL UNKNOWN_C43CAA
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	LDA $04
	CLC
	ADC #window_stats::title
	TAY
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	BEQL @UNKNOWN11
	LDX #.LOWORD(UNKNOWN_7E9C9F)
	BRA @UNKNOWN7
@UNKNOWN6:
	SEP #PROC_FLAGS::ACCUM8
	LDA $16
	STA a:.LOWORD(RAM),X
	INY
	INX
@UNKNOWN7:
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	STA $16
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN8
	AND #$00FF
	CMP #$0058
	BNE @UNKNOWN6
@UNKNOWN8:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0058
	STA a:.LOWORD(RAM),X
	INX
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	CLC
	ADC #window_stats::menu_page_number
	TAY
	STY $14
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC #$0060
	STA a:.LOWORD(RAM),X
	INX
	LDA #$0059
	STA a:.LOWORD(RAM),X
	INX
	LDA #$0000
	STA a:.LOWORD(RAM),X
	JSL UNKNOWN_C43CAA
	.A16
	PROMOTENEARPTR .LOWORD(UNKNOWN_7E9C9F), $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #$FFFF
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	JSL READ_NAME
	JSL UNKNOWN_C43CAA
	MOVE_INT $06, $0E
	JSL STRLEN
	STA $12
	MOVE_INT $06, $0E
	LDA $12
	DEC
	DEC
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
	LDY $14
	LDA a:.LOWORD(RAM),Y
	STA $14
	LDX $04
	LDA a:window_stats::option_count,X
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	TAX
	LDA .LOWORD(UNKNOWN_7E89D4) + u89D4_entry::unknown4,X
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	TAX
	LDA $14
	CMP .LOWORD(UNKNOWN_7E89D4) + u89D4_entry::unknown6,X
	BNE @UNKNOWN9
	LDA #$0061
	BRA @UNKNOWN10
@UNKNOWN9:
	CLC
	ADC #$0061
@UNKNOWN10:
	JSR a:.LOWORD(PRINT_LETTER)
	LDA #$0059
	JSR a:.LOWORD(PRINT_LETTER)
	BRA @UNKNOWN12
@UNKNOWN11:
	LDA $02
	CLC
	ADC #$0013
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$FFFF
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
@UNKNOWN12:
	LDX $02
	LDA a:.LOWORD(RAM)+2,X
	CMP #$FFFF
	BEQ @UNKNOWN13
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	CLC
	ADC #.LOWORD(UNKNOWN_7E89D4)
	STA $02
	JMP @UNKNOWN2
@UNKNOWN13:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTS
