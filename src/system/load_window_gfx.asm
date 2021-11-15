
LOAD_WINDOW_GFX: ;$C47C3F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 44
	LOADPTR TEXT_WINDOW_GFX, $0E
	LOADPTR UNKNOWN_7F0000, $12
	JSL DECOMP
	LOADPTR UNKNOWN_7F2000, $0E
	LOADPTR UNKNOWN_7F1000, $12
	LDA #$2A00
	JSL MEMCPY24
	LOADPTR UNKNOWN_7F3200, $0E
	LDX #$0600
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL MEMSET24
	.A16
	LDA .LOWORD(GAME_STATE)+game_state::text_flavour
	AND #$00FF
	DEC
	OPTIMIZED_MULT $04, 3
	TAX
	INX
	INX
	LDA f:TEXT_WINDOW_PROPERTIES,X
	AND #$00FF
	CMP #$0008
	BNE @UNKNOWN1
	LOADPTR FLAVOURED_TEXT_GFX, $0E
	LOADPTR UNKNOWN_7F0100, $12
	JSL DECOMP
	.A16
@UNKNOWN1:
	LOADPTR FONT_PTR_TABLE, $06
	LDY #(.SIZEOF(font_table_entry) * FONT::BATTLE) + font_table_entry::height
	LDA [$06],Y
	STA $2A
	LDY #(.SIZEOF(font_table_entry) * FONT::BATTLE) + font_table_entry::width
	LDA [$06],Y
	STA $28
	LOADPTR UNKNOWN_7F2A00, $24
	LDA #$0006
	STA $22
	LDA #$0000
	STA $04
	JMP @UNKNOWN8
@UNKNOWN2:
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0340
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E3492)
	JSL MEMSET16
	STZ .LOWORD(UNKNOWN_7E9654)
	STZ .LOWORD(UNKNOWN_7E9652)
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	LDA #$0002
	STA .LOWORD(UNKNOWN_7E9E23)
	LDA #$0000
	STA $02
	BRA @UNKNOWN4
@UNKNOWN3:
	AND #$00FF
	INC $0A
	SEC
	SBC #$0050
	AND #$007F
	TAY
	MOVE_INT FONT_PTR_TABLE + (.SIZEOF(font_table_entry) * FONT::BATTLE) + font_table_entry::graphics, $06
	LDA $2A
	JSL MULT16
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX $28
	LDA $22
	JSL UNKNOWN_C44B3A
	INC $02
@UNKNOWN4:
	LDA [$0A]
	AND #$00FF
	BNE @UNKNOWN3
	LDY #$0000
	STY $20
	JMP @UNKNOWN6
@UNKNOWN5:
	TYA
	ASL
	ASL
	ASL
	ASL
	STA $02
	LDA $04
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	TAX
	STX $1E
	PROMOTENEARPTR .LOWORD(UNKNOWN_7E3492), $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $1A
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $02
	MOVE_INT $24, $06
	TXA
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA $02
	MOVE_INTX $1A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	MOVE_INT $24, $06
	LDX $1E
	TXA
	CLC
	ADC #$0100
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA $02
	CLC
	ADC #$0010
	MOVE_INTX $1A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDY $20
	INY
	STY $20
@UNKNOWN6:
	CPY #$0004
	BCCL @UNKNOWN5
	INC $04
@UNKNOWN8:
	LDA $04
	CMP #$0004
	BCCL @UNKNOWN2
	LDY #$0000
	BRA @UNKNOWN13
@UNKNOWN10:
	LOADPTR UNKNOWN_7F0070, $06
	MOVE_INT $06, $1A
	LDX #$0000
	BRA @UNKNOWN12
@UNKNOWN11:
	LDA [$24]
	STA $1E
	XBA
	AND #$00FF
	EOR #$00FF
	STA $02
	LDA [$06]
	AND #$00FF
	STA $04
	LDA $1E
	AND #$FF00
	ORA $04
	ORA $02
	STA [$24]
	MOVE_INT $24, $06
	INC $06
	INC $06
	MOVE_INT $06, $24
	MOVE_INT $1A, $06
	INC $06
	INC $06
	MOVE_INT $06, $1A
	INX
@UNKNOWN12:
	CPX #$0008
	BCC @UNKNOWN11
	INY
@UNKNOWN13:
	CPY #$0020
	BCC @UNKNOWN10
	LOADPTR UNKNOWN_7F2C00, $16
	LOADPTR STATUS_EQUIP_WINDOW_TEXT_2, $24
	JMP @UNKNOWN19
@UNKNOWN14:
	CMP #$0020
	BEQL @UNKNOWN18
	STA $02
	AND #$FFF0
	CLC
	ADC $02
	ASL
	ASL
	ASL
	ASL
	STA $0A
	STZ $0C
	CLC
	VAR_ADD_CONST_INT_ASSIGN $7F0000, $0A
	LOADPTR UNKNOWN_7F0070, $06
	MOVE_INT $06, $1A
	LDX #$0000
	BRA @UNKNOWN17
@UNKNOWN16:
	LDA [$0A]
	STA $1E
	XBA
	AND #$00FF
	EOR #$00FF
	STA $02
	LDA [$06]
	AND #$00FF
	STA $04
	LDA $1E
	AND #$FF00
	ORA $04
	ORA $02
	STA [$16]
	LDY #$0100
	LDA [$0A],Y
	STA $1E
	XBA
	AND #$00FF
	EOR #$00FF
	STA $02
	LDA [$06],Y
	AND #$00FF
	STA $04
	LDA $1E
	AND #$FF00
	ORA $04
	ORA $02
	STA [$16],Y
	MOVE_INT $16, $06
	INC $06
	INC $06
	MOVE_INT $06, $16
	INC $0A
	INC $0A
	MOVE_INT $1A, $06
	INC $06
	INC $06
	MOVE_INT $06, $1A
	INX
@UNKNOWN17:
	CPX #$0008
	BCC @UNKNOWN16
@UNKNOWN18:
	MOVE_INT $24, $06
	INC $06
	INC $06
	MOVE_INT $06, $24
@UNKNOWN19:
	LDA [$24]
	BNEL @UNKNOWN14
	PLD
	RTL
