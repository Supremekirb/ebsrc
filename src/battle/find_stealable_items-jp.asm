
FIND_STEALABLE_ITEMS: ;$C241DC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 28
	STZ $1A
	STZ $18
	JMP @UNKNOWN12
@UNKNOWN0:
	LDA $18
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	STA $16
	CMP #$0001
	BCCL @UNKNOWN11
	LDA $16
	CMP #$0004
	BGTL @UNKNOWN11
	LDA #$0000
	STA $14
	BRA @UNKNOWN5
@UNKNOWN3:
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA BATTLERS_TABLE+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN4
	LDA BATTLERS_TABLE,X
	CMP $16
	BNE @UNKNOWN4
	LDA BATTLERS_TABLE+battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN4
	LDA BATTLERS_TABLE+7,X
	AND #$00FF
	STA $12
@UNKNOWN4:
	LDA $14
	INC
	STA $14
@UNKNOWN5:
	CMP #$0006
	BCC @UNKNOWN3
	STZ $10
	JMP @UNKNOWN10
@UNKNOWN6:
	LDA $10
	STA $02
	INC $02
	LDA $02
	CMP $12
	BEQL @UNKNOWN9
	LDA $16
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAY
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $10
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	STA $04
	STA $0E
	LDA $04
	BEQL @UNKNOWN9
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $04
	OPTIMIZED_MULT $04, .SIZEOF(item)
	TAX
	CLC
	ADC #item::cost
	PHA
	MOVE_INT $06, $0A
	PLA
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	BEQ @UNKNOWN9
	CMP #$0122
	BCS @UNKNOWN9
	TXA
	CLC
	ADC #item::type
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	AND #$0030
	CMP #$0020
	BNE @UNKNOWN9
	LDA CHAR_STRUCT+char_struct::equipment+EQUIPMENT_SLOT::WEAPON,Y
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN9
	LDA CHAR_STRUCT+char_struct::equipment+EQUIPMENT_SLOT::BODY,Y
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN9
	LDA CHAR_STRUCT+char_struct::equipment+EQUIPMENT_SLOT::ARMS,Y
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN9
	LDA CHAR_STRUCT+char_struct::equipment+EQUIPMENT_SLOT::OTHER,Y
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN9
	LDA $0E
	STA $04
	SEP #PROC_FLAGS::ACCUM8
	LDY #.LOWORD(UNKNOWN_7EA9D4)
	STA ($1A),Y
	REP #PROC_FLAGS::ACCUM8
	INC $1A
@UNKNOWN9:
	INC $10
@UNKNOWN10:
	LDA $10
	CMP #$000E
	BCCL @UNKNOWN6
@UNKNOWN11:
	INC $18
@UNKNOWN12:
	LDA $18
	CMP #$0006
	BCCL @UNKNOWN0
	LDA $1A
	PLD
	RTS
