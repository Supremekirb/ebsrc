
UNKNOWN_C06A1B: ;$C06A1B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	AND #$7FFF
	STA $14
	LOADPTR DOOR_DATA&$FF0000, $0A
	LDA $14
	CLC
	ADC $0A
	STA $0A
	STA $06
	LDA $0C
	STA $08
	LDA [$06]
	AND #$7FFF
	JSL GET_EVENT_FLAG
	TAX
	LDA #$0000
	STA $12
	LDA [$06]
	CMP #EVENT_FLAG_UNSET
	BLTEQ @UNKNOWN0
	LDA #$0001
	STA $12
@UNKNOWN0:
	LDA $12
	STA $02
	TXA
	CMP $02
	BNE @UNKNOWN1
	LDY #$0002
	LDA [$0A],Y
	PHA
	INY
	INY
	LDA [$0A],Y
	STA $08
	PLA
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA #$0000
	JSL UNKNOWN_C064E3
	STZ UNKNOWN_7E5DAA
	STZ UNKNOWN_7E5DA8
@UNKNOWN1:
	PLD
	RTS
