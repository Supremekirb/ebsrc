
UNKNOWN_C22A3A: ;$C22A3A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 29
	STY $1B
	STA $02
	STA $19
	TXA
	DEC
	STA $04
	TYA
	DEC
	STA $02
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	TAX
	STX $17
	LDY $1B
	TYA
	STA $15
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $15
	TAY
	DEY
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	STA ($13),Y
	REP #PROC_FLAGS::ACCUM8
	LDA $15
	INC
	STA $15
@UNKNOWN1:
	CMP #$000E
	BCS @UNKNOWN2
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	STA $13
	LDA $15
	TAY
	SEP #PROC_FLAGS::ACCUM8
	LDA ($13),Y
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	BNE @UNKNOWN0
@UNKNOWN2:
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $11
	LDA $15
	DEC
	STA $02
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	CLC
	ADC $02
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA __BSS_START__,X
	LDX $17
	REP #PROC_FLAGS::ACCUM8
	LDA $19
	STA $02
	JSL GIVE_ITEM_TO_CHARACTER
	LDA $04
	INC
	STA $13
	PHA
	LDA $02
	PLY
	STY $02
	CMP $02
	BNEL @UNKNOWN28
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::WEAPON
	STA $0F
	SEP #PROC_FLAGS::ACCUM8
	LDA ($0F)
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $17
	LDY $1B
	CPY $17
	BNEL @UNKNOWN8
	LDA $19
	STA $02
	JSL UNKNOWN_C22351
	SEP #PROC_FLAGS::ACCUM8
	STA ($0F)
	REP #PROC_FLAGS::ACCUM8
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::BODY
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN5
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN5:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN6
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN6:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCC @UNKNOWN7
	JMP @UNKNOWN36
@UNKNOWN7:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
	JMP @UNKNOWN36
@UNKNOWN8:
	.A16
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::BODY
	TAX
	STX $13
	LDA __BSS_START__,X
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BNEL @UNKNOWN13
	LDA $19
	STA $02
	JSL UNKNOWN_C22351
	SEP #PROC_FLAGS::ACCUM8
	LDX $13
	STA __BSS_START__,X
	LDA ($0F)
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN10
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA ($0F)
@UNKNOWN10:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN11
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN11:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCC @UNKNOWN12
	JMP @UNKNOWN36
@UNKNOWN12:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
	JMP @UNKNOWN36
@UNKNOWN13:
	.A16
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::ARMS
	TAX
	STX $13
	LDA __BSS_START__,X
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BNEL @UNKNOWN18
	LDA $19
	STA $02
	JSL UNKNOWN_C22351
	SEP #PROC_FLAGS::ACCUM8
	LDX $13
	STA __BSS_START__,X
	LDA ($0F)
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN15
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA ($0F)
@UNKNOWN15:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN16
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN16:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCC @UNKNOWN17
	JMP @UNKNOWN36
@UNKNOWN17:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
	JMP @UNKNOWN36
@UNKNOWN18:
	.A16
	LDA $11
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::OTHER
	TAX
	STX $13
	LDA __BSS_START__,X
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BNEL @UNKNOWN23
	LDA $19
	STA $02
	JSL UNKNOWN_C22351
	SEP #PROC_FLAGS::ACCUM8
	LDX $13
	STA __BSS_START__,X
	LDA ($0F)
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN20
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA ($0F)
@UNKNOWN20:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN21
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN21:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCC @UNKNOWN22
	JMP @UNKNOWN36
@UNKNOWN22:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
	JMP @UNKNOWN36
@UNKNOWN23:
	CPY $17
	BCS @UNKNOWN24
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA ($0F)
@UNKNOWN24:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN25
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN25:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN26
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN26:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCC @UNKNOWN27
	JMP @UNKNOWN36
@UNKNOWN27:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
	JMP @UNKNOWN36
@UNKNOWN28:
	.A16
	LDY #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::WEAPON
	LDA ($11),Y
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BNE @UNKNOWN29
	LDX #$0000
	LDA $13
	JSL CHANGE_EQUIPPED_WEAPON
	BRA @UNKNOWN32
@UNKNOWN29:
	.A16
	LDY #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::BODY
	LDA ($11),Y
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BNE @UNKNOWN30
	LDX #$0000
	LDA $13
	JSL CHANGE_EQUIPPED_BODY
	BRA @UNKNOWN32
@UNKNOWN30:
	LDY #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::ARMS
	LDA ($11),Y
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BNE @UNKNOWN31
	LDX #$0000
	LDA $13
	JSL CHANGE_EQUIPPED_ARMS
	BRA @UNKNOWN32
@UNKNOWN31:
	LDY #.LOWORD(CHAR_STRUCT) + char_struct::equipment + EQUIPMENT_SLOT::OTHER
	LDA ($11),Y
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BNE @UNKNOWN32
	LDX #$0000
	LDA $13
	JSL CHANGE_EQUIPPED_OTHER
@UNKNOWN32:
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	.A16
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::WEAPON
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN33
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN33:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN34
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN34:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN35
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN35:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDY $1B
	TYA
	CMP $02
	BCS @UNKNOWN36
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	DEC
	STA __BSS_START__,X
@UNKNOWN36:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
