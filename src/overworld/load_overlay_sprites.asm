
LOAD_OVERLAY_SPRITES: ;$C4B26B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA #$5600
	STA $12
	LOADPTR ENTITY_OVERLAY_SPRITES, $0A
	LDA #$0000
	STA $02
	BRA @FIRSTLOOPSTART
@LOADNEXTOVERLAYSPRITE:
	MOVE_INT $0A, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0002
	LDA [$0A],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	LDA [$06]
	TAX
	LDA $12
	JSR UNKNOWN_C4B1B8
	STA $10
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0003
	LDA [$0A],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	LDA [$06]
	TAX
	LDA $10
	JSR UNKNOWN_C4B1B8
	STA $12
	LDA #$0004
	CLC
	ADC $0A
	STA $0A
	INC $02
@FIRSTLOOPSTART:
	LDA f:ENTITY_OVERLAY_COUNT
	AND #$00FF
	STA $04
	LDA $02
	CMP $04
	BCC @LOADNEXTOVERLAYSPRITE
	LDA #$0000
	STA $0E
	BRA @SECONDLOOPSTART
@FILLNEXTENTRY:
	ASL
	TAX
	LOADPTR ENTITY_OVERLAY_MUSHROOMIZED, $06
	LDA $06
	STA ENTITY_MUSHROOMIZED_OVERLAY_PTRS,X
	LOADPTR ENTITY_OVERLAY_SWEATING, $06
	LDA $06
	STA ENTITY_SWEATING_OVERLAY_PTRS,X
	LOADPTR ENTITY_OVERLAY_RIPPLE, $06
	LDA $06
	STA ENTITY_RIPPLE_OVERLAY_PTRS,X
	LOADPTR ENTITY_OVERLAY_BIG_RIPPLE, $06
	LDA $06
	STA ENTITY_BIG_RIPPLE_OVERLAY_PTRS,X
	LDA $0E
	INC
	STA $0E
@SECONDLOOPSTART:
	CMP #MAX_ENTITIES
	BCC @FILLNEXTENTRY
	PLD
	RTL
