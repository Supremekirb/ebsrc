
APPLY_CONDIMENT: ;$C2B172
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action_argument,X
	AND #$00FF
	STA $04
	STA $16
	LDA $04
	SEP #PROC_FLAGS::ACCUM8
	JSL FIND_CONDIMENT
	.A16
	STA $02
	CMP #$0000
	BNE @UNKNOWN0
	JMP @UNKNOWN6
@UNKNOWN0:
	LDX $02
	STX $14
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::id,X
	LDX $14
	JSL TAKE_ITEM_FROM_CHARACTER
	LDY #$0000
	STY $12
	BRA @UNKNOWN4
@UNKNOWN1:
	PHA
	LDA $16
	STA $04
	PLA
	AND #$00FF
	CMP $04
	BNE @UNKNOWN3
	TXA
	INC
	MOVE_INTY $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN2
	TXA
	INC
	INC
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	CMP $02
	BNE @UNKNOWN5
@UNKNOWN2:
	.A16
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_WAS_PRETTY_GOOD
	LOADPTR CONDIMENT_TABLE, $06
	LDY $12
	TYA
	OPTIMIZED_MULT $04, 7
	INC
	INC
	INC
	CLC
	ADC $06
	STA $06
	STA $1E
	LDA $08
	STA $20
	BRA @UNKNOWN7
@UNKNOWN3:
	INY
	STY $12
@UNKNOWN4:
	LOADPTR CONDIMENT_TABLE, $06
	TYA
	OPTIMIZED_MULT $04, 7
	TAX
	PHA
	MOVE_INT $06, $0A
	PLA
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	BEQ @UNKNOWN5
	JMP @UNKNOWN1
@UNKNOWN5:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_DIDNT_TASTE_VERY_GOOD
@UNKNOWN6:
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $16
	STA $04
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::strength
	CLC
	ADC $06
	STA $06
	STA $1E
	LDA $08
	STA $20
@UNKNOWN7:
	PLD
	RTS
