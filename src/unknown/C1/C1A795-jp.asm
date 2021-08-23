
UNKNOWN_C1A795: ;$C1A795
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	TAX
	DEC
	STA $20
	LDA #$0001
	STA $1E
@UNKNOWN0:
	LDA #$0004
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LDA #$0006
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	LDA $1E
	DEC
	JSR UNKNOWN_C11887
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	STA $1E
	JSR a:.LOWORD(UNKNOWN_C19437)
	LDA $1E
	BNE @UNKNOWN1
	JMP @UNKNOWN23
@UNKNOWN1:
	CREATE_WINDOW_NEAR #WINDOW::EQUIP_MENU_ITEMLIST
	LOADPTR STATUS_EQUIP_WINDOW_TEXT_11, $06
	LDA $1E
	DEC
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$0004
	LDA #$0007
	JSL READ_NAME
	LDA #$0000
	STA $04
	STA $1C
	LDA #$FFFF
	STA $1A
	LDA #$0000
	STA $02
	JMP @UNKNOWN10
@UNKNOWN2:
	LDA $20
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	STA $18
	BNE @UNKNOWN3
	JMP @UNKNOWN9
@UNKNOWN3:
	LDA $18
	JSR a:.LOWORD(GET_ITEM_TYPE)
	CMP #$0002
	BEQ @UNKNOWN4
	JMP @UNKNOWN9
@UNKNOWN4:
	LDA $18
	JSL GET_ITEM_SUBTYPE
	CMP $1E
	BEQ @UNKNOWN5
	JMP @UNKNOWN9
@UNKNOWN5:
	LDY $20
	INY
	STY $16
	LDX $18
	TYA
	JSL UNKNOWN_C3EE14
	CMP #$0000
	BNE @UNKNOWN6
	JMP @UNKNOWN9
@UNKNOWN6:
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $18
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #.SIZEOF(item::name)
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	JSL MEMCPY16
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9C9F)+.SIZEOF(item::name)
	LDX $02
	INX
	LDY $16
	REP #PROC_FLAGS::ACCUM8
	TYA
	JSL $C3E560
	CMP #$0000
	BEQ @UNKNOWN8
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSL STRLEN
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0022
	STA .LOWORD(UNKNOWN_7E9C9F),X
	STZ .LOWORD(UNKNOWN_7E9C9F)+1,X
	REP #PROC_FLAGS::ACCUM8
	LDA $1C
	STA $04
	STA $1A
@UNKNOWN8:
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDA $02
	INC
	JSR a:.LOWORD(UNKNOWN_C115F4)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0073
	STA a:.LOWORD(RAM)+14,X
	REP #PROC_FLAGS::ACCUM8
	LDA $1C
	STA $04
	INC $04
	LDA $04
	STA $1C
@UNKNOWN9:
	INC $02
@UNKNOWN10:
	LDA $02
	CMP #$000E
	BCS @UNKNOWN11
	BEQ @UNKNOWN11
	JMP @UNKNOWN2
@UNKNOWN11:
	LOADPTR STATUS_EQUIP_WINDOW_TEXT_13, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDA #$FFFF
	JSR a:.LOWORD(UNKNOWN_C115F4)
	LDY $1A
	LDX #$0000
	LDA #$0001
	JSR a:.LOWORD(UNKNOWN_C1181B)
	LDA $20
	SEP #PROC_FLAGS::ACCUM8
	INC
	STA .LOWORD(UNKNOWN_7E9CD6)
	REP #PROC_FLAGS::ACCUM8
	LDA $1E
	CMP #$0001
	BEQ @UNKNOWN12
	CMP #$0002
	BEQ @UNKNOWN13
	CMP #$0003
	BEQ @UNKNOWN14
	CMP #$0004
	BEQ @UNKNOWN15
	BRA @UNKNOWN16
@UNKNOWN12:
	LOADPTR UNKNOWN_C22562, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	BRA @UNKNOWN16
@UNKNOWN13:
	LOADPTR UNKNOWN_C225AC, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	BRA @UNKNOWN16
@UNKNOWN14:
	LOADPTR UNKNOWN_C2260D, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	BRA @UNKNOWN16
@UNKNOWN15:
	LOADPTR UNKNOWN_C22673, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
@UNKNOWN16:
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9CD4)
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	TAX
	STX $1A
	JSR a:.LOWORD(UNKNOWN_C19437)
	JSR a:.LOWORD(UNKNOWN_C11F8A)
	LDX $1A
	CPX #$FFFF
	BNE @UNKNOWN21
	LDA $1E
	CMP #$0001
	BEQ @UNKNOWN17
	CMP #$0002
	BEQ @UNKNOWN18
	CMP #$0003
	BEQ @UNKNOWN19
	CMP #$0004
	BEQ @UNKNOWN20
	BRA @UNKNOWN22
@UNKNOWN17:
	LDX #$0000
	LDA $20
	INC
	JSL CHANGE_EQUIPPED_WEAPON
	BRA @UNKNOWN22
@UNKNOWN18:
	LDX #$0000
	LDA $20
	INC
	JSL CHANGE_EQUIPPED_BODY
	BRA @UNKNOWN22
@UNKNOWN19:
	LDX #$0000
	LDA $20
	INC
	JSL CHANGE_EQUIPPED_ARMS
	BRA @UNKNOWN22
@UNKNOWN20:
	LDX #$0000
	LDA $20
	INC
	JSL CHANGE_EQUIPPED_OTHER
	BRA @UNKNOWN22
@UNKNOWN21:
	CPX #$0000
	BEQ @UNKNOWN22
	LDA $20
	INC
	JSR a:.LOWORD(EQUIP_ITEM)
@UNKNOWN22:
	LDA #$0007
	JSR CLOSE_WINDOW
	LDA $20
	INC
	JSL UNKNOWN_C1A778
	JMP @UNKNOWN0
@UNKNOWN23:
	PLD
	RTS
