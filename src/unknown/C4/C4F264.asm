
UNKNOWN_C4F264: ;$C4F264
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 32
	STA $1E
	LDX #$0000
	STX $1C
	LOADPTR PHOTOGRAPHER_CFG_TABLE, $0A
	LDA $1E
	LDY #.SIZEOF(photographer_config_entry)
	JSL MULT168
	CLC
	ADC $0A
	STA $0A
	STA $06
	LDA $0C
	STA $08
	LDA [$06]
	JSL GET_EVENT_FLAG
	CMP #$0000
	BNE @PREPARE_PHOTO_DISPLAY
	JMP @RETURN
@PREPARE_PHOTO_DISPLAY:
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EB4EF)
	LDA $1E
	STA .LOWORD(CUR_PHOTO_DISPLAY)
	LDA .LOWORD(UNKNOWN_7E4A5A)
	STA $02
	STZ .LOWORD(UNKNOWN_7E4A5A)
	LDY #$0000
	LDX #$2000
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA #$0000
	STA a:.LOWORD(RAM),X
	INX
	INX
	INY
@UNKNOWN2:
	CPY #$0400
	BCC @UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	STZ a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	LOADPTR UNKNOWN_E1E924+6, $0E
	LDX #$0020
	LDA #$0220
	JSL MEMCPY16
	LDY #$0004
	LDA [$0A],Y
	ASL
	ASL
	ASL
	TAX
	LDY #$0002
	LDA [$0A],Y
	ASL
	ASL
	ASL
	JSL LOAD_MAP_AT_POSITION
	LDA $02
	STA .LOWORD(UNKNOWN_7E4A5A)
	STZ a:.LOWORD(BG2_Y_POS)
	STZ a:.LOWORD(BG2_X_POS)
	STZ .LOWORD(UNKNOWN_7EB4EF)
	STZ $1A
	LDA #$0000
	STA $02
	BRA @UNKNOWN5
@UNKNOWN3:
	LDA $02
	STA $04
	ASL
	ADC $04
	ASL
	STA $18
	CLC
	ADC #$002A
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $14
	LDA $08
	STA $16
	LDA [$06]
	BEQ @UNKNOWN4
	LDA $1A
	STA .LOWORD(UNKNOWN_7E0A38)
	INC $1A
	LDA $18
	CLC
	ADC #photographer_config_entry::object_config + photographer_config_entry_object::tile_x
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	ASL
	ASL
	ASL
	STA $0E
	LDA $18
	CLC
	ADC #photographer_config_entry::object_config + photographer_config_entry_object::tile_y
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	ASL
	ASL
	ASL
	STA $10
	LDY #$FFFF
	LDX #EVENT_SCRIPT::EVENT_799
	MOVE_INT $14, $06
	LDA [$06]
	JSL CREATE_ENTITY
@UNKNOWN4:
	INC $02
@UNKNOWN5:
	LDA $02
	CMP #$0004
	BCS @UNKNOWN6
	BEQ @UNKNOWN6
	JMP @UNKNOWN3
@UNKNOWN6:
	LDA #$0000
	STA $04
	JMP @UNKNOWN9
@UNKNOWN7:
	LDA $1E
	ASL
	ASL
	ASL
	CLC
.IF .DEFINED(JPN)
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC $04
	TAX
	LDA a:game_state::saved_photo_states + photo_state::party,X
.ELSE
	ADC $04
	TAX
	LDA .LOWORD(GAME_STATE) + game_state::saved_photo_states + photo_state::party,X
.ENDIF
	AND #$00FF
	STA $02
	BEQ @UNKNOWN8
	LDA $02
	AND #$001F
	CMP #$0012
	BCS @UNKNOWN8
	CMP #$0000
	BEQ @UNKNOWN8
	LDA $1A
	STA .LOWORD(UNKNOWN_7E0A38)
	INC $1A
	LDA $04
	ASL
	ASL
	TAX
	STX $1C
	LDA $02
	JSL UNKNOWN_C079EC
	STA $12
	LDX $1C
	TXA
	CLC
	ADC #$000E
	MOVE_INTY $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	ASL
	ASL
	ASL
	STA $0E
	TXA
	CLC
	ADC #$0010
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	ASL
	ASL
	ASL
	STA $10
	LDY #$FFFF
	LDX #EVENT_SCRIPT::EVENT_800
	LDA $12
	JSL CREATE_ENTITY
	TAY
	LDX $02
	TYA
	JSL UNKNOWN_C07A31
@UNKNOWN8:
	INC $04
@UNKNOWN9:
	LDA $04
	CMP #$0006
	BCS @EXIT_LOOP
	BEQ @EXIT_LOOP
	JMP @UNKNOWN7
@EXIT_LOOP:
	LDX #$0001
	STX $1C
@RETURN:
	LDX $1C
	TXA
	PLD
	RTL
