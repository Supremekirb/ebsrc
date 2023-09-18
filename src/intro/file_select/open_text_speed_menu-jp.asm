
OPEN_TEXT_SPEED_MENU: ;$C1F3C2
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	TAY
	STY $1C
	CREATE_WINDOW_NEAR #WINDOW::FILE_SELECT_TEXT_SPEED
	JSR SET_INSTANT_PRINTING
	LOADPTR FILE_SELECT_TEXT_SELECT_TEXT_SPEED, $0E
	LDA #$0009
	JSR PRINT_STRING
	LOADPTR FILE_SELECT_TEXT_TEXTSPEED_STRINGS, $06
	MOVE_INT $06, $18
	MOVE_INT_CONSTANT NULL, $0A
	MOVE_INT $06, $0E
	MOVE_INT $0A, $12
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C114B1
	LDA #TEXT_SPEED_STRING_LENGTH
	MOVE_INTX $18, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT $0A, $12
	LDX #$0002
	LDA #$0000
	JSR UNKNOWN_C114B1
	LDA #TEXT_SPEED_STRING_LENGTH*2
	MOVE_INTX $18, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT $0A, $12
	LDX #$0003
	LDA #$0000
	JSR UNKNOWN_C114B1
	LDA GAME_STATE+game_state::text_speed
	AND #$00FF
	BEQ @UNKNOWN0
	AND #$00FF
	TAX
	DEX
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0001
@UNKNOWN1:
	TXA
	JSR UNKNOWN_C11887
	LDY $1C
	BEQL $F3E5
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
	LDA $9B67
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
	LDA $9B67
	AND #$00FF
	TAX
	STX $16
	BRA @UNKNOWN5
	LDA #$0001
	JSR $2109
	TAX
	STX $16
	BEQ @UNKNOWN5
	TXA
	SEP #PROC_FLAGS::ACCUM8
	STA $9B67
	REP #PROC_FLAGS::ACCUM8
	LDA $B675
	AND #$00FF
	DEC
	JSL $C0F962
@UNKNOWN5:
	LDX $16
	TXA
	PLD
	RTS
