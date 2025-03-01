
FILE_SELECT_MENU: ;$C1ED5B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STA $04
	LDA #WINDOW::FILE_SELECT_MAIN
	JSR CREATE_WINDOW
	LDY #$0000
	STY $18
	JMP @UNKNOWN14
@UNKNOWN0:
	TYA
	JSL LOAD_GAME_SLOT
	LDA GAME_STATE + game_state::favourite_thing + 1
	AND #$00FF
	BEQL @UNKNOWN8
	LDY $18
	TYA
	SEP #PROC_FLAGS::ACCUM8
	CLC
	ADC #$0031
	STA UNKNOWN_7E9C9F
	LDA #$005B
	STA UNKNOWN_7E9C9F+1
	LDA #$0020
	STA UNKNOWN_7E9C9F+2
	LDX #$0000
	BRA @UNKNOWN4
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	STA UNKNOWN_7E9C9F+3,X
	INX
@UNKNOWN2:
	REP #PROC_FLAGS::ACCUM8
	LDA CHAR_STRUCT+char_struct::name,X
	AND #$00FF
	BEQ @UNKNOWN3
	CPX #.SIZEOF(char_struct::name)
	BCC @UNKNOWN1
@UNKNOWN3:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0020
	STA UNKNOWN_7E9C9F+3,X
	INX
@UNKNOWN4:
	CPX #.SIZEOF(char_struct::name)
	BCC @UNKNOWN2
@UNKNOWN5:
	REP #PROC_FLAGS::ACCUM8
	PROMOTENEARPTR UNKNOWN_7E9C9F+7, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LOADPTR FILE_SELECT_TEXT_START_NEW_GAME, $12
	LDA #$0005
	JSL MEMCPY24
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 $9C83, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR $12CA
	TAX
	CPX #$0001
	BNE @UNKNOWN6
	LDA #$0020
	BRA @UNKNOWN6_
@UNKNOWN6:
	STX $02
	LDA #$0007
	SEC
	SBC $02
	TAX
	LDA $8C98,X
	AND #$00FF
	CLC
	ADC #$0030
@UNKNOWN6_:
	SEP #PROC_FLAGS::ACCUM8
	STA $9F56
	LDA $8C9E
	CLC
	ADC #$0030
	STA $9F57
	REP #PROC_FLAGS::ACCUM8
	PROMOTENEARPTR UNKNOWN_7E9C9F + 14, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
@UNKNOWN9:
	LOADPTR FILE_SELECT_TEXT_LEVEL, $12
	LDA #$0006
	JSL MEMCPY24
	PROMOTENEARPTR $9F5E, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LOADPTR $C494AE, $06
	LDA $9B67
	AND #$00FF
	DEC
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0004
	JSL MEMCPY24
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	LDY $18
	STA $B672,Y
	REP #PROC_FLAGS::ACCUM8
	LDA $9C7E
	AND #$00FF
	XBA
	AND #$FF00
	STA $16
	BRA @UNKNOWN7
@UNKNOWN8:
	LDY $18
	TYA
	SEP #PROC_FLAGS::ACCUM8
	CLC
	ADC #$0031
	STA UNKNOWN_7E9C9F
	REP #PROC_FLAGS::ACCUM8
	PROMOTENEARPTR UNKNOWN_7E9C9F + 1, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LOADPTR FILE_SELECT_TEXT_TEXTSPEED, $12
	LDA #$000A
	JSL MEMCPY24
	SEP #PROC_FLAGS::ACCUM8
	STZ $9F55
	LDY $18
	TYX
	STZ $B672,X
	REP #PROC_FLAGS::ACCUM8
	LDA #$100
	STA $16
@UNKNOWN7:
	STY $02
	INC $02
	PROMOTENEARPTR UNKNOWN_7E9C9F, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDA $16
	ORA $02
	JSR $1BB0
	LDY $02
	STY $18
@UNKNOWN14:
	CPY #$0003
	BCCL @UNKNOWN0
	LDY #$0000
	TYX
	LDA #$0001
	JSR $1FA6
	LDA $04
	BEQL @UNKNOWN18
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+43,X
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAY
	STY $16
	LDA CURRENT_SAVE_SLOT
	AND #$00FF
	TAX
	DEX
	BRA @UNKNOWN17
@UNKNOWN16:
	LDA __BSS_START__+2,Y
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	CLC
	ADC #.LOWORD(MENU_OPTIONS)
	TAY
	STY $16
	DEX
@UNKNOWN17:
	BNE @UNKNOWN16
	LDA #$0006
	JSR UNKNOWN_C10FEA
	LDY $16
	LDA a:menu_option::text_y,Y
	TAX
	LDA a:menu_option::text_x,Y
	INC
	JSR UNKNOWN_C438A5
	LDY $16
	TYA
	CLC
	ADC #menu_option::label
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$FFFF
	JSR PRINT_STRING
	LDA #$0000
	JSR UNKNOWN_C10FEA
	BRA @UNKNOWN20
@UNKNOWN18:
	JSR CORRUPTION_CHECK
@UNKNOWN19:
	LDA UNKNOWN_7E0028
	AND #$00FF
	BNE @UNKNOWN19
	LDA #MUSIC::SETUP_SCREEN
	JSL CHANGE_MUSIC
	LOADPTR UNKNOWN_C1ECD1, $0E
	JSR UNKNOWN_C11F5A
	LDA #$0000
	JSR SELECTION_MENU
	SEP #PROC_FLAGS::ACCUM8
	STA CURRENT_SAVE_SLOT
	JSR UNKNOWN_C11F8A
@UNKNOWN20:
	.A16
	LDA CURRENT_SAVE_SLOT
	AND #$00FF
	DEC
	JSL LOAD_GAME_SLOT
	LDA CURRENT_SAVE_SLOT
	AND #$00FF
	PLD
	RTS
