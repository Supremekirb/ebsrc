
OPEN_SOUND_MENU: ;$C1F568
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	TAY
	STY $1C
	CREATE_WINDOW_NEAR #WINDOW::FILE_SELECT_MUSIC_MODE
	JSR SET_INSTANT_PRINTING
	LOADPTR FILE_SELECT_TEXT_SELECT_SOUND_SETTING, $0E
	LDA #$0006
	JSR PRINT_STRING
	LOADPTR FILE_SELECT_TEXT_SOUND_SETTING_STRINGS, $0A
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT $06, $18
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $18, $06
	MOVE_INT $06, $12
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C114B1
	LDA #SOUND_SETTING_STRING_LENGTH
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	MOVE_INT $06, $12
	LDX #$0002
	LDA #$0000
	JSR UNKNOWN_C114B1
	LDA GAME_STATE+game_state::sound_setting
	AND #$00FF
	BEQ @UNKNOWN0
	AND #$00FF
	TAX
	DEX
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0000
@UNKNOWN1:
	TXA
	JSR UNKNOWN_C11887
	LDY $1C
	BEQL @UNKNOWN5
	LDA $8C96
	ASL
	TAX
	LDA $8C26,X
	LDY #$004C
	JSL MULT168
	TAX
	LDA $89ED,X
	OPTIMIZED_MULT $04, 44
	CLC
	ADC #$8D12
	TAY
	STY $1C
	LDA $9B68
	AND #$00FF
	TAX
	DEX
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA __BSS_START__ + 2,Y
	OPTIMIZED_MULT $04, 44
	CLC
	ADC #$8D12
	TAY
	STY $1C
	DEX
@UNKNOWN4:
	BNE @UNKNOWN3
	LDA #$0006
	JSR UNKNOWN_C10FEA
	LDY $1C
	LDA __BSS_START__ + 10,Y
	TAX
	LDA __BSS_START__ + 8,Y
	INC
	JSR UNKNOWN_C438A5
	LDY $1C
	TYA
	CLC
	ADC #$0013
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$FFFF
	JSR PRINT_STRING
	LDA #$0000
	JSR UNKNOWN_C10FEA
	LDA $9B68
	AND #$00FF
	TAX
	STX $16
	BRA @UNKNOWN7
@UNKNOWN5:
	LDA #$0001
	JSR $2109
	TAX
	STX $16
	BEQ @UNKNOWN6
	TXA
	SEP #PROC_FLAGS::ACCUM8
	STA $9B68
@UNKNOWN6:
	REP #PROC_FLAGS::ACCUM8
	LDA $B675
	AND #$00FF
	DEC
	JSL $C0F962
@UNKNOWN7:
	LDX $16
	TXA
	PLD
	RTS
