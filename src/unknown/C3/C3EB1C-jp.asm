
UNKNOWN_C3EB1C: ;$C3EB1C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	LDY #$0000
	STY $14
	BRA @UNKNOWN1
@UNKNOWN0:
	INY
	STY $14
@UNKNOWN1:
	REP #PROC_FLAGS::ACCUM8
	TYA
	OPTIMIZED_MULT $04, 5
	TAX
	LDA f:TIMED_ITEM_TRANSFORMATION_TABLE,X
	AND #$00FF
	BEQ @UNKNOWN2
	SEP #PROC_FLAGS::ACCUM8
	CMP $00
	BNE @UNKNOWN0
@UNKNOWN2:
	REP #PROC_FLAGS::ACCUM8
	TYA
	JSL UNKNOWN_C48F98
	LDX #$0000
	STX $12
	BRA @UNKNOWN10
@UNKNOWN3:
	TXA
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
	STA $04
	LDA #$0000
	STA $02
	STA $10
	BRA @UNKNOWN6
@UNKNOWN4:
	LDA $00
	AND #$00FF
	STA $02
	LDA $0E
	CMP $02
	BNE @UNKNOWN5
	LDY $14
	TYA
	JSL INITIALIZE_ITEM_TRANSFORMATION
	BRA @UNKNOWN11
@UNKNOWN5:
	LDA $10
	STA $02
	INC $02
	LDA $02
	STA $10
@UNKNOWN6:
	LDA #$000E
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN9
	LDA $04
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM)+34,X
	AND #$00FF
	STA $0E
	BNE @UNKNOWN4
@UNKNOWN9:
	LDX $12
	INX
	STX $12
@UNKNOWN10:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	STA $02
	TXA
	CMP $02
	BCC @UNKNOWN3
@UNKNOWN11:
	PLD
	RTL
