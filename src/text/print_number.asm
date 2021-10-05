
PRINT_NUMBER: ;$C10DF6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	MOVE_INT $26, $0A
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BNE @UNKNOWN0
	JMP @UNKNOWN5
@UNKNOWN0:
.IF CLEAN_ROM
	MOVE_INT_CONSTANT $FFFF967F, $06 ; fun with C enums?
.ELSE
	MOVE_INT_CONSTANT 9999999, $06
.ENDIF
	LDA $06
	CMP $0A
	LDA $08
	SBC $0C
	BCS @UNKNOWN1
	MOVE_INT $06, $0A
@UNKNOWN1:
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	STA $16
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	JSR a:.LOWORD(UNKNOWN_C10D7C)
	TAX
	STX $14
	STX $02
	LDA #$0007
	SEC
	SBC $02
	CLC
	ADC #.LOWORD(UNKNOWN_7E895A)
	TAY
	STY $12
	LDA $16
	TAX
	LDA a:window_stats::unknown18,X
	AND #$00FF
	STA $16
	AND #$0080
	BNE @UNKNOWN4
	LDA $16
	AND #$000F
	INC
	LDX $14
	STX $02
	CMP $02
	BCS @UNKNOWN2
	TXA
@UNKNOWN2:
	STX $02
	SEC
	SBC $02
	OPTIMIZED_MULT $04, 6
	JSL UNKNOWN_C43D95
	BRA @UNKNOWN4
@UNKNOWN3:
	LDY $12
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	CLC
	ADC #CHAR::ZERO
	INY
	STY $12
	JSR a:.LOWORD(PRINT_LETTER)
	LDX $14
	DEX
	STX $14
@UNKNOWN4:
	LDX $14
	BNE @UNKNOWN3
@UNKNOWN5:
	PLD
	RTS
