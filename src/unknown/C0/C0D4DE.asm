
UNKNOWN_C0D4DE: ;$C0D4DE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 28
	LOADPTR UNKNOWN_7F2000, $0E
	PROMOTENEARPTR $0200, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	LDA #$0200
	JSL MEMCPY24
	LDA #$0000
	STA $04
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $04
	ASL
	CLC
	ADC #$0200
	TAY
	STY $1A
	LDA __BSS_START__,Y
	STA $18
	AND #$001F
	TAX
	STX $16
	LDA $18
	LSR
	LSR
	LSR
	LSR
	LSR
	AND #$001F
	STA $02
	SEP #PROC_FLAGS::ACCUM8
	LDA #$000A
	SEP #PROC_FLAGS::INDEX8
	TAY
	REP #PROC_FLAGS::ACCUM8
	LDA $18
	JSL ASR8_UNKNOWN1
	AND #$001F
	REP #PROC_FLAGS::INDEX8
	LDY #$0003
	PHA
	LDX $16
	TXA
	CLC
	ADC $02
	PLX
	STX $02
	CLC
	ADC $02
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $16
	SEP #PROC_FLAGS::INDEX8
	LDY #$000A
	JSL ASL16_ENTRY2
	PHA
	LDA $16
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $02
	LDA $16
	CLC
	ADC $02
	REP #PROC_FLAGS::INDEX8
	PLY
	STY $02
	CLC
	ADC $02
	LDY $1A
	STA __BSS_START__,Y
	INC $04
@UNKNOWN1:
	LDA $04
	CMP #$0080
	BCCL @UNKNOWN0
	LDA #$0018
	JSL UNKNOWN_C0856B
	PLD
	RTL
