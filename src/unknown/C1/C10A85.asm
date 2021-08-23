
UNKNOWN_C10A85: ;$C10A85
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STY $18
	STX $02
	STX $16
	STA $14
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	STA $12
	CMP #$FFFF
	BNE @UNKNOWN0
	JMP @UNKNOWN10
@UNKNOWN0:
	LDA $12
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY .LOWORD(WINDOW_STATS_TABLE)+window_stats::text_x,X
	STY $10
	LDA .LOWORD(WINDOW_STATS_TABLE)+window_stats::text_y,X
	STA $04
	TYA
	CMP .LOWORD(WINDOW_STATS_TABLE)+window_stats::width,X
	BNE @UNKNOWN3
	LDA .LOWORD(WINDOW_STATS_TABLE)+window_stats::height,X
	LSR
	DEC
	STA $02
	LDA $04
	CMP $02
	BEQ @UNKNOWN1
	INC $04
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA $14
	JSL UNKNOWN_C437B8
@UNKNOWN2:
	LDY #$0000
	STY $10
@UNKNOWN3:
	LDA .LOWORD(BLINKING_TRIANGLE_FLAG)
	BEQ @UNKNOWN6
	CPY #$0000
	BNE @UNKNOWN6
	LDA $16
	STA $02
	CMP #$0020
	BEQ @UNKNOWN4
	LDA $02
	CMP #$0040
	BNE @UNKNOWN6
@UNKNOWN4:
	LDA .LOWORD(BLINKING_TRIANGLE_FLAG)
	CMP #$0001
	BNE @UNKNOWN5
	JMP @UNKNOWN9
@UNKNOWN5:
	CMP #$0002
	BNE @UNKNOWN6
	LDA #$0020
	STA $02
	STA $16
@UNKNOWN6:
	LDA $12
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY $10
	TYA
	ASL
	STA $02
	LDY .LOWORD(WINDOW_STATS_TABLE)+window_stats::width,X
	LDA $04
	JSL MULT16
	ASL
	ASL
	CLC
	ADC .LOWORD(WINDOW_STATS_TABLE)+window_stats::tilemap_address,X
	CLC
	ADC $02
	STA $0E
	LDA $16
	STA $02
	CMP #$0022
	BNE @UNKNOWN7
	LDX #$0C00
	BRA @UNKNOWN8
@UNKNOWN7:
	LDX $18
@UNKNOWN8:
	LDA $02
	AND #$000F
	PHA
	LDA $02
	AND #$FFF0
	ASL
	PLY
	STY $02
	CLC
	ADC $02
	STX $02
	CLC
	ADC $02
	STA $02
	STA $18
	LDA $0E
	TAX
	LDA $02
	STA a:.LOWORD(RAM),X
	LDA $12
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA .LOWORD(WINDOW_STATS_TABLE)+window_stats::width,X
	ASL
	STA $02
	LDA $0E
	CLC
	ADC $02
	TAX
	LDA $18
	STA $02
	CLC
	ADC #$0010
	STA a:.LOWORD(RAM),X
	LDY $10
	INY
	STY $10
@UNKNOWN9:
	LDA $12
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY $10
	TYA
	STA .LOWORD(WINDOW_STATS_TABLE)+window_stats::text_x,X
	LDA $04
	STA .LOWORD(WINDOW_STATS_TABLE)+window_stats::text_y,X
@UNKNOWN10:
	PLD
	RTS
