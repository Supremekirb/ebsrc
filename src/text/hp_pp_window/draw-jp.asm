
; Drawing HP/PP windows?
DRAW_HP_PP_WINDOW: ;$C203C3
	@TILEARRPTR = $10
	@CHAR_ENTRY = $20
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 36
	STA $22
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	STA @CHAR_ENTRY
	CLC
	ADC #$000D
	STA $02
	LDX #$0001
	LDA $02
	JSL UNKNOWN_C223D9
	TAY
	STY $1E
	LDX #$0001
	LDA $02
	JSL UNKNOWN_C223D9
	STA $04
	LDY $1E
	TYA
	AND #$FFF0
	CLC
	ADC $04
	TAY
	STY $1C
	LDY #char_struct::hp_pp_window_options
	LDA (@CHAR_ENTRY),Y
	STA $04
	STA $1A
	LDA $04
	CMP #$0C00
	BNE @UNKNOWN0
	LDA #$0C00
	STA $02
	STA $18
	STA $1E
	LDA #$0800
	STA $16
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $02
	JSL UNKNOWN_C22474
	LDY #$0400
	JSL MULT16
	STA $02
	STA $18
	LDA #$1000
	STA $1E
	STZ $16
@UNKNOWN1:
	LDA .LOWORD(BATTLE_MENU_CURRENT_CHARACTER_ID)
	CMP $22
	BNE @UNKNOWN2
	LDA #ACTIVE_HPPP_WINDOW_Y_OFFSET
	STA $14
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA #NORMAL_HPPP_WINDOW_Y_OFFSET
	STA $14
@UNKNOWN3:
	LDA $22
	OPTIMIZED_MULT $04, 7
	PHA
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	OPTIMIZED_MULT $04, 7
	PHA
	ASL
	PLA
	ROR
	STA $02
	LDA #$0010
	SEC
	SBC $02
	PLY
	STY $02
	CLC
	ADC $02
	ASL
	STA $02
	LDA $14
	OPTIMIZED_MULT $04, 64
	CLC
	ADC $02
	CLC
	ADC #.LOWORD(BG2_BUFFER)
	TAX
	LDA $1A
	STA $04
	CLC
	ADC #$2004
	STA a:.LOWORD(RAM),X
	INX
	INX
	LDA #HPPP_WINDOW_WIDTH - 2
	STA $12
	BRA @UNKNOWN6
@UNKNOWN4:
	LDA $04
	CLC
	ADC #$2005
	STA a:.LOWORD(RAM),X
@UNKNOWN5:
	INX
	INX
	LDA $12
	DEC
	STA $12
@UNKNOWN6:
	BNE @UNKNOWN4
	LDA $04
	CLC
	ADC #$6004
	STA a:.LOWORD(RAM),X
	TXA
	INC
	INC
	CLC
	ADC #$0040 - HPPP_WINDOW_WIDTH * 2
	TAX
	LDA $04
	CLC
	ADC #$2006
	STA a:.LOWORD(RAM),X
	TXA
	INC
	INC
	STA @TILEARRPTR
	LDA $22
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	DEC
	ASL
	ASL
	CLC
	ADC #$22A0
	STA $14
	LDX #$0000
	BRA @UNKNOWN9
@UNKNOWN6_:
	TXY
	LDA ($20),Y
	AND #$00FF
	BEQ @UNKNOWN7
	LDA $18
	STA $02
	LDA $14
	CLC
	ADC $02
	STA (@TILEARRPTR)
	INC @TILEARRPTR
	INC @TILEARRPTR
	LDA $14
	INC
	STA $14
	BRA @UNKNOWN8
@UNKNOWN7:
	LDA $18
	STA $02
	CLC
	ADC #$2007
	STA (@TILEARRPTR)
	INC @TILEARRPTR
	INC @TILEARRPTR
@UNKNOWN8:
	INX
@UNKNOWN9:
	CPX #HPPP_WINDOW_WIDTH - 3
	BNE @UNKNOWN6_
	LDA $18
	STA $02
	LDY $1C
	TYA
	CLC
	ADC $02
	CLC
	ADC #$2000
	STA (@TILEARRPTR)
	LDX @TILEARRPTR
	INX
	INX
	LDA $04
	CLC
	ADC #$6006
	STA a:.LOWORD(RAM),X
	TXA
	INC
	INC
	CLC
	ADC #$0040 - HPPP_WINDOW_WIDTH * 2
	TAX
	LDA $04
	CLC
	ADC #$2006
	STA a:.LOWORD(RAM),X
	TXA
	INC
	INC
	STA @TILEARRPTR
	LDA $22
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	DEC
	ASL
	ASL
	CLC
	ADC #$22B0
	STA $14
	LDX #$0000
	BRA @UNKNOWN13
@UNKNOWN10:
	TXY
	LDA (@CHAR_ENTRY),Y
	AND #$00FF
	BEQ @UNKNOWN11
	LDA $14
	CLC
	ADC $02
	STA (@TILEARRPTR)
	INC @TILEARRPTR
	INC @TILEARRPTR
	LDA $14
	INC
	STA $14
	BRA @UNKNOWN12
@UNKNOWN11:
	LDA $02
	CLC
	ADC #$2017
	STA (@TILEARRPTR)
	INC @TILEARRPTR
	INC @TILEARRPTR
@UNKNOWN12:
	INX
@UNKNOWN13:
	CPX #HPPP_WINDOW_WIDTH - 3
	BNE @UNKNOWN10
	LDY $1C
	TYA
	CLC
	ADC $02
	CLC
	ADC #$2010
	STA (@TILEARRPTR)
	LDX @TILEARRPTR
	INX
	INX
	LDA $04
	CLC
	ADC #$6006
	STA a:.LOWORD(RAM),X
	TXA
	INC
	INC
	CLC
	ADC #$0040 - HPPP_WINDOW_WIDTH * 2
	STA $02
	LDY #$0042
	LDA (@CHAR_ENTRY),Y
	TAY
	STY $18
	LDY #char_struct::current_hp
	LDA (@CHAR_ENTRY),Y
	TAX
	LDA $22
	LDY $18
	JSR a:.LOWORD(FILL_CHARACTER_HP_TILE_BUFFER)
	LOADPTR UNKNOWN_C3E3F8, $06
	LDA $22
	OPTIMIZED_MULT $04, 24
	CLC
	ADC #.LOWORD(HPPP_WINDOW_BUFFER)
	TAY
	LDX #$0002
	STX $12
	BRA @UNKNOWN19
@UNKNOWN14:
	LDA $1A
	STA $04
	CLC
	ADC #$2006
	LDX $02
	STA a:.LOWORD(RAM),X
	INC $02
	INC $02
	LDA #$0002
	STA $1C
	BRA @UNKNOWN16
@UNKNOWN15:
	LDA [$06]
	AND #$00FF
	CLC
	ADC $1E
	CLC
	ADC #$2000
	LDX $02
	STA a:.LOWORD(RAM),X
	INC $06
	INC $02
	INC $02
	LDA $1C
	DEC
	STA $1C
@UNKNOWN16:
	BNE @UNKNOWN15
	LDA #HPPP_WINDOW_WIDTH - 4
	STA $1C
	BRA @UNKNOWN18
@UNKNOWN17:
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC $16
	LDX $02
	STA a:.LOWORD(RAM),X
	INY
	INY
	INC $02
	INC $02
	LDA $1C
	DEC
	STA $1C
@UNKNOWN18:
	BNE @UNKNOWN17
	LDA $04
	CLC
	ADC #$6006
	LDX $02
	STA a:.LOWORD(RAM),X
	LDA $02
	INC
	INC
	CLC
	ADC #$0040 - HPPP_WINDOW_WIDTH * 2
	STA $02
	LDX $12
	DEX
	STX $12
@UNKNOWN19:
	BNE @UNKNOWN14
	LDY #$0048
	LDA (@CHAR_ENTRY),Y
	STA $0E
	LDY #char_struct::current_pp
	LDA (@CHAR_ENTRY),Y
	TAY
	LDA @CHAR_ENTRY
	CLC
	ADC #char_struct::afflictions
	TAX
	LDA $22
	JSR a:.LOWORD(FILL_CHARACTER_PP_TILE_BUFFER)
	LDA $22
	OPTIMIZED_MULT $04, 24
	CLC
	ADC #.LOWORD(HPPP_WINDOW_BUFFER) + hp_pp_window_buffer::pp1
	TAY
	LDX #$0002
	STX $12
	BRA @UNKNOWN25
@UNKNOWN20:
	LDA $1A
	STA $04
	CLC
	ADC #$2006
	LDX $02
	STA a:.LOWORD(RAM),X
	INC $02
	INC $02
	LDA #$0002
	STA $1C
	BRA @UNKNOWN22
@UNKNOWN21:
	LDA [$06]
	AND #$00FF
	CLC
	ADC $1E
	CLC
	ADC #$2000
	LDX $02
	STA a:.LOWORD(RAM),X
	INC $06
	INC $02
	INC $02
	LDA $1C
	DEC
	STA $1C
@UNKNOWN22:
	BNE @UNKNOWN21
	LDA #HPPP_WINDOW_WIDTH - 4
	STA $1C
	BRA @UNKNOWN24
@UNKNOWN23:
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC $16
	LDX $02
	STA a:.LOWORD(RAM),X
	INY
	INY
	INC $02
	INC $02
	LDA $1C
	DEC
	STA $1C
@UNKNOWN24:
	BNE @UNKNOWN23
	LDA $04
	CLC
	ADC #$6006
	LDX $02
	STA a:.LOWORD(RAM),X
	LDA $02
	INC
	INC
	CLC
	ADC #$0040 - HPPP_WINDOW_WIDTH * 2
	STA $02
	LDX $12
	DEX
	STX $12
@UNKNOWN25:
	BNE @UNKNOWN20
	LDA $1A
	STA $04
	CLC
	ADC #$A004
	LDX $02
	STA a:.LOWORD(RAM),X
	LDX $02
	INX
	INX
	LDY #HPPP_WINDOW_WIDTH - 2
	BRA @UNKNOWN27
@UNKNOWN26:
	LDA $04
	CLC
	ADC #$A005
	STA a:.LOWORD(RAM),X
	INX
	INX
	DEY
@UNKNOWN27:
	BNE @UNKNOWN26
	LDA $04
	CLC
	ADC #$E004
	STA a:.LOWORD(RAM),X
	PLD
	RTS
