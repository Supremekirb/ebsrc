
UNKNOWN_C4EB04: ;$C4EB04
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STY $18
	STX $02
	STA $16
	LDA BG3_Y_POS
	LSR
	LSR
	LSR
	CLC
	ADC $02
	AND #$001F
	STA $02
	STA $14
	LDA $18
	INC
	LSR
	PHA
	LDA $02
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $16
	CLC
	ADC #$7C00
	PLY
	STY $02
	SEC
	SBC $02
	STA $04
	LOADPTR UNKNOWN_7F4000, $06
	LDA $16
	ASL
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDY $04
	LDA $18
	ASL
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LDA $14
	STA $02
	CMP #$001F
	BEQ @UNKNOWN0
	LDA $04
	CLC
	ADC #$0020
	STA $12
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $04
	SEC
	SBC #$03E0
	STA $12
@UNKNOWN1:
	LOADPTR UNKNOWN_7F4000, $06
	LDA $16
	ASL
	CLC
	ADC #$0040
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA $12
	TAY
	LDA $18
	ASL
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	PLD
	RTL
