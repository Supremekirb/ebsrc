
UNKNOWN_C209A0: ;$C209A0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	CMP #$FFFF
	BNE @UNKNOWN4
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAX
	STX $10
	LDY a:window_stats::tilemap_address,X
	STY $0E
	LDY a:window_stats::height,X
	LDA a:window_stats::width,X
	JSL MULT16
	STA $02
	BRA @UNKNOWN2
@UNKNOWN0:
	LDY $0E
	LDA __BSS_START__,Y
	BEQ @UNKNOWN1
	JSL FREE_TILE_SAFE
@UNKNOWN1:
	LDA #$0040
	LDY $0E
	STA __BSS_START__,Y
	INY
	INY
	STY $0E
	LDA $02
	DEC
	STA $02
@UNKNOWN2:
	LDA $02
	BNE @UNKNOWN0
	LDX $10
	LDA a:window_stats::unknown59,X
	AND #$00FF
	BEQ @UNKNOWN3
	AND #$00FF
	DEC
	ASL
	TAX
	LDA #$FFFF
	STA UNKNOWN_7E894E,X
@UNKNOWN3:
	LDX $10
	SEP #PROC_FLAGS::ACCUM8
	STZ a:window_stats::title,X
	STZ a:window_stats::unknown59,X
	LDA #$0001
	STA UNKNOWN_7E9623
	JSL UNKNOWN_C07C5B
@UNKNOWN4:
	PLD
	RTL
