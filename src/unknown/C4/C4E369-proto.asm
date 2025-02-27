
UNKNOWN_C4E369: ;$C4E369
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LOADPTR UNKNOWN_7F0000, $06
	LDY #$0000
	LDX #$0001
	TXA
	JSL FADE_OUT_WITH_MOSAIC
	JSL UNKNOWN_C08726
	JSL UNKNOWN_C021E6
	LDA #$0000
	STA $18
	BRA @UNKNOWN2
@UNKNOWN0:
	ASL
	TAX
	LDA ENTITY_SCRIPT_TABLE,X
	CMP #$FFFF
	BEQ @UNKNOWN1
	TXA
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA __BSS_START__,X
	ORA #$8000
	STA __BSS_START__,X
@UNKNOWN1:
	LDA $18
	INC
	STA $18
@UNKNOWN2:
	CMP #$001E
	BCC @UNKNOWN0
	LDX #BATTLEBG_LAYER::NONE
	LDA #BATTLEBG_LAYER::UNKNOWN279
	JSL LOAD_BACKGROUND_ANIMATION
	LDY #$0000
	LDX #$7C00
	TYA ;BG_TILEMAP_SIZE::NORMAL
	JSL SET_BG3_VRAM_LOCATION
	LDA #$0062
	JSL SET_OAM_SIZE
	STZ BG3_X_POS
	STZ BG3_Y_POS
	STZ BG2_Y_POS
	STZ BG2_X_POS
	STZ BG1_Y_POS
	STZ BG1_X_POS
	JSL UPDATE_SCREEN
	LDA #$0000
	STA [$06]
	COPY_TO_VRAM1P $06, $7C00, $800, $03
	.A16
	LOADPTR UNKNOWN_7F0000, $06
	MOVE_INT $06, $0E
	LDX #$1000
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL MEMSET24
	.A16
	LOADPTR UNKNOWN_E1D6E1, $0E
	LDA #$0200
@UNKNOWN3:
	STA $12
	LDA #$007F
	STA $14
	JSL DECOMP
	LOADPTR CAST_NAMES_GFX, $0E
	LOADPTR UNKNOWN_7F0600, $12
	JSL DECOMP
	JSL UNKNOWN_C4E7AE
	COPY_TO_VRAM1P $06, $0000, $8000, $00
	JSL UNKNOWN_C47F87
	.A16
	LOADPTR UNKNOWN_E1D815, $0E
	LDX #$0020
	LDA #$0208
	JSL MEMCPY16
	LOADPTR SPRITE_GROUP_PALETTES, $0E
	LDX #$0100
	LDA #$0300
	JSL MEMCPY16
	LOADPTR UNKNOWN_E1E4E6, $0E
	LOADPTR UNKNOWN_7F7000, $12
	JSL DECOMP
	STZ CUR_TEXT_PAL + 6
	STZ CUR_TEXT_PAL
	LDY #.LOWORD(CUR_TEXT_PAL) + 2
	LDA __BSS_START__,Y
	STA $16
	LDX #.LOWORD(CUR_TEXT_PAL) + 4
	LDA __BSS_START__,X
	STA __BSS_START__,Y
	LDA $16
	STA __BSS_START__,X
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA UNKNOWN_7E0030
	LDA #$0014
	STA TM_MIRROR
	REP #PROC_FLAGS::ACCUM8
	STZ UNKNOWN_7EB4CF
	STZ UNKNOWN_7EB4D1
	JSL UNKNOWN_C08744
	PLD
	RTL
