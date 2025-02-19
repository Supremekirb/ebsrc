
UNKNOWN_EF031E: ;$EF031E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LDA CURRENT_ENTITY_SLOT
	STA $18
	ASL
	TAX
	LDA ENTITY_SCRIPT_VAR1_TABLE,X
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	TAY
	STY UNKNOWN_7E4DC6
	LDA __BSS_START__+60,Y
	STA $02
	STA $04
	STA $16
	LDA $02
	OPTIMIZED_MULT $04, .SIZEOF(player_position_buffer_entry)
	CLC
	ADC #.LOWORD(PLAYER_POSITION_BUFFER)
	STA $14
	LDA ENTITY_SCRIPT_VAR0_TABLE,X
	STA $12
	LDA ($14) ;player_position_buffer_entry::x_coord
	STA ENTITY_ABS_X_TABLE,X
	LDY #player_position_buffer_entry::y_coord
	LDA ($14),Y
	STA ENTITY_ABS_Y_TABLE,X
	LDY #player_position_buffer_entry::walking_style
	LDA ($14),Y
	BEQ @UNKNOWN0
	LDY CURRENT_ENTITY_SLOT
	TAX
	LDA $12
	JSL UNKNOWN_C07A56
	LDA #$0002
	STA $0E
	LDY $02
	LDX #$001E
	LDA $12
	JSL UNKNOWN_C03EC3
	AND #$00FF
	LDX UNKNOWN_7E4DC6
	STA __BSS_START__+60,X
	JMP @UNKNOWN14
@UNKNOWN0:
	LDA UNKNOWN_7E9F33
	BEQ @UNKNOWN3
	CMP #$0002
	BEQ @UNKNOWN3
	CMP #$0001
	BEQL @UNKNOWN8
	CMP #$0003
	BEQL @UNKNOWN9
	JMP @UNKNOWN11
@UNKNOWN3:
	LDA #$0002
	STA $0E
	LDY $02
	LDX #$000C
	LDA $12
	JSL UNKNOWN_C03EC3
	STA $02
	AND #$00FF
	LDX UNKNOWN_7E4DC6
	STA __BSS_START__+60,X
	LDA $16
	STA $04
	CMP $02
	BEQ @UNKNOWN4
	LDA $04
	INC
	CMP $02
	BNE @UNKNOWN6
@UNKNOWN4:
	LDY CURRENT_ENTITY_SLOT
	STY $10
	LDY #player_position_buffer_entry::walking_style
	LDA ($14),Y
	TAX
	LDA $12
	LDY $10
	JSL UNKNOWN_C07A56
	LDA GAME_STATE + game_state::unknown90
	BEQL @UNKNOWN11
	BRA @UNKNOWN7
@UNKNOWN6:
	LDY CURRENT_ENTITY_SLOT
	LDX #$000E
	LDA $12
	JSL UNKNOWN_C07A56
@UNKNOWN7:
	LDA $18
	ASL
	STA $16
	TAX
	LDY #player_position_buffer_entry::direction
	LDA ($14),Y
	STA ENTITY_DIRECTIONS,X
	LDA $16
	CLC
	ADC #.LOWORD(ENTITY_SCRIPT_VAR7_TABLE)
	TAX
	LDA __BSS_START__,X
	AND #$1FFF
	STA __BSS_START__,X
	BRA @UNKNOWN11
@UNKNOWN8:
	TXA
	CLC
	ADC #.LOWORD(ENTITY_SCRIPT_VAR7_TABLE)
	TAX
	LDA __BSS_START__,X
	ORA #$7000
	STA __BSS_START__,X
	BRA @UNKNOWN11
@UNKNOWN9:
	TXA
	CLC
	ADC #.LOWORD(ENTITY_SCRIPT_VAR7_TABLE)
	TAX
	LDA __BSS_START__,X
	ORA #SPRITE_TABLE_10_FLAGS::UNKNOWN14 | SPRITE_TABLE_10_FLAGS::UNKNOWN13 | SPRITE_TABLE_10_FLAGS::UNKNOWN12
	STA __BSS_START__,X
	LDX #.LOWORD(UNKNOWN_7E9F3B)
	LDA __BSS_START__,X
	DEC
	STA __BSS_START__,X
	BNE @UNKNOWN11
	LDY #.LOWORD(UNKNOWN_7E9F3D)
	LDA __BSS_START__,Y
	DEC
	STA __BSS_START__,Y
	BNE @UNKNOWN10
	LDA #$000F
	STA UNKNOWN_7E9F35
	LDA #$FFFF
	STA __BSS_START__,X
@UNKNOWN10:
	JSL RAND
	ASL
	ASL
	AND #$000F
	INC
	INC
	INC
	INC
	STA UNKNOWN_7E9F3B
	LDA UNKNOWN_7E9F39
	EOR #$0004
	STA $16
	STA UNKNOWN_7E9F39
	LDA $18
	ASL
	TAX
	LDA $16
	STA ENTITY_DIRECTIONS,X
@UNKNOWN11:
	LDA $18
	ASL
	TAX
	LDA #$0004
	STA ENTITY_SCRIPT_VAR3_TABLE,X
	LDX UNKNOWN_7E9F35
	DEX
	STX UNKNOWN_7E9F35
	BNE @UNKNOWN13
	LDA $12
	JSR UNKNOWN_EF02C4
	LDA UNKNOWN_7E9F33
	CMP #$0003
	BNE @UNKNOWN12
	LDA #$0004
	STA UNKNOWN_7E9F3D
	LDA #$0006
	STA UNKNOWN_7E9F39
	LDA #$000F
	STA UNKNOWN_7E9F3B
	LDA #$FFFF
	STA UNKNOWN_7E9F35
	BRA @UNKNOWN13
@UNKNOWN12:
	LDA #$003C
	STA UNKNOWN_7E9F35
@UNKNOWN13:
	LDA $18
	ASL
	TAX
	LDY #player_position_buffer_entry::tile_flags
	LDA ($14),Y
	STA ENTITY_SURFACE_FLAGS,X
@UNKNOWN14:
	PLD
	RTL
