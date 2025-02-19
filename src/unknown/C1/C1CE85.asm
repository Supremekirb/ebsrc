
UNKNOWN_C1CE85: ;$C1CE85
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TAY
	STY $14
	LDA #$00FF
	STA $02
	LDA __BSS_START__+1,Y
	AND #$00FF
	TAX
	LDA __BSS_START__,Y
	AND #$00FF
	JSL GET_CHARACTER_ITEM
	STA $12
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $12
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC $06
	STA $06
	LDY $14
	STY $04
	INC $04
	INC $04
	LDA #$0002
	LDX $04
	STA __BSS_START__,X
	TYA
	INC
	INC
	INC
	INC
	STA $10
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA ($10)
	REP #PROC_FLAGS::ACCUM8
	TYA
	CLC
	ADC #$0005
	STA $0E
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,Y
	STA ($0E)
	LDY #item::type
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $12
	AND #$0030
	CMP #$0010
	BEQ @UNKNOWN0
	CMP #$0020
	BEQ @UNKNOWN0
	CMP #$0030
	BEQ @UNKNOWN2
	JMP @UNKNOWN6
@UNKNOWN0:
	LDA #item::effect
	CLC
	ADC $06
	STA $06
	LDY $14
	LDA __BSS_START__,Y
	AND #$00FF
	TAX
	LDA [$06]
	JSR DETERMINE_TARGETTING
	STA $02
	AND #$00FF
	BNE @UNKNOWN1
	LDA #$0000
	JMP @UNKNOWN7
@UNKNOWN1:
	LDA [$06]
	LDX $04
	STA __BSS_START__,X
	SEP #PROC_FLAGS::INDEX8
	LDY #$0008
	LDA $02
	JSL ASR8_UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	STA ($10)
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	STA ($0E)
	BRA @UNKNOWN6
@UNKNOWN2:
	.A16
	.I16
	LDA $12
	AND #$000C
	BEQ @UNKNOWN3
	CMP #$0004
	BNE @UNKNOWN6
@UNKNOWN3:
	LDY $14
	LDA __BSS_START__,Y
	AND #$00FF
	TAX
	STX $12
	DEX
	SEP #PROC_FLAGS::ACCUM8
	LDY #item::flags
	LDA [$06],Y
	AND f:ITEM_USABLE_FLAGS,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN5
	LDA #item::effect
	CLC
	ADC $06
	STA $06
	LDX $12
	LDA [$06]
	JSR DETERMINE_TARGETTING
	STA $02
	AND #$00FF
	BNE @UNKNOWN4
	LDA #$0000
	BRA @UNKNOWN7
@UNKNOWN4:
	LDA [$06]
	LDX $04
	STA __BSS_START__,X
	SEP #PROC_FLAGS::INDEX8
	LDY #$0008
	LDA $02
	JSL ASR8_UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	STA ($10)
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	STA ($0E)
	BRA @UNKNOWN6
@UNKNOWN5:
	.A16
	.I16
	LDA #$0003
	LDX $04
	STA __BSS_START__,X
@UNKNOWN6:
	REP #PROC_FLAGS::ACCUM8
	LDA $02
@UNKNOWN7:
	REP #PROC_FLAGS::INDEX8
	PLD
	RTS
