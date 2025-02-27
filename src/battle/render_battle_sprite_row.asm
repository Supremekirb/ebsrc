
RENDER_BATTLE_SPRITE_ROW: ;$C2F724
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STA $16
	LDA #.LOWORD(BATTLERS_TABLE) + .SIZEOF(battler) * 8
	STA $02
	LDA #$0008
	STA $04
	STA $14
	JMP @UNKNOWN12
@UNKNOWN0:
	LDX $02
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQL @UNKNOWN11
	LDX $02
	LDA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	AND #$00FF
	CMP #$0001
	BEQL @UNKNOWN11
	LDX $02
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNEL @UNKNOWN11
	LDX $02
	LDA a:battler::row,X
	AND #$00FF
	CMP $16
	BNEL @UNKNOWN11
	LDX $02
	LDA a:battler::sprite,X
	BEQL @UNKNOWN11
	LDA $02
	CLC
	ADC #battler::unknown72
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	BEQ @UNKNOWN6
	SEP #PROC_FLAGS::ACCUM8
	DEC
	STA __BSS_START__,X
	LDY #$0003
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	JSL DIVISION16
	AND #$0001
	BNEL @UNKNOWN11
@UNKNOWN6:
	LDA $02
	CLC
	ADC #battler::unknown73
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	BEQ @UNKNOWN7
	SEP #PROC_FLAGS::ACCUM8
	DEC
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	AND #$0004
	BNE @UNKNOWN7
	LDX $02
	LDA a:battler::sprite_y,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD98
	TAY
	LDX $02
	LDA a:battler::sprite_x,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD96
	TAX
	STX $12
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	OPTIMIZED_MULT $04, 80
	CLC
	ADC #.LOWORD(ALT_BATTLE_SPRITEMAPS)
	LDX $12
	JSL UNKNOWN_C08CD5
	JMP @UNKNOWN11
@UNKNOWN7:
	LDX $02
	LDA a:battler::use_alt_spritemap,X
	AND #$00FF
	BEQ @UNKNOWN8
	LDX $02
	LDA a:battler::sprite_y,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD98
	TAY
	LDX $02
	LDA a:battler::sprite_x,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD96
	TAX
	STX $10
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	OPTIMIZED_MULT $04, 80
	CLC
	ADC #.LOWORD(ALT_BATTLE_SPRITEMAPS)
	LDX $10
	JSL UNKNOWN_C08CD5
	JMP @UNKNOWN11
@UNKNOWN8:
	LDA UNKNOWN_7EADA2
	BEQ @UNKNOWN10
	LDX $02
	LDA a:battler::unknown74,X
	AND #$00FF
	BEQ @UNKNOWN9
	LDA UNKNOWN_7E0002
	AND #$00FF
	AND #$0008
	BEQ @UNKNOWN10
@UNKNOWN9:
	LDX $02
	LDA a:battler::sprite_y,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD98
	TAY
	LDX $02
	LDA a:battler::sprite_x,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD96
	TAX
	STX $12
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	OPTIMIZED_MULT $04, 80
	CLC
	ADC #.LOWORD(ALT_BATTLE_SPRITEMAPS)
	LDX $12
	JSL UNKNOWN_C08CD5
	BRA @UNKNOWN11
@UNKNOWN10:
	LDX $02
	LDA a:battler::sprite_y,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD98
	TAY
	LDX $02
	LDA a:battler::sprite_x,X
	AND #$00FF
	SEC
	SBC UNKNOWN_7EAD96
	TAX
	STX $0E
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	OPTIMIZED_MULT $04, 80
	CLC
	ADC #.LOWORD(BATTLE_SPRITEMAPS)
	LDX $0E
	JSL UNKNOWN_C08CD5
@UNKNOWN11:
	LDA $02
	CLC
	ADC #.SIZEOF(battler)
	STA $02
	LDA $14
	STA $04
	INC $04
	LDA $04
	STA $14
@UNKNOWN12:
	LDA $04
	CMP #$0020
	BCCL @UNKNOWN0
	PLD
	RTS
