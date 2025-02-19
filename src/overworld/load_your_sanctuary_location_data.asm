
LOAD_YOUR_SANCTUARY_LOCATION_DATA: ;$C4E13E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	STY $20
	STX $02
	STX $1E
	STA $04
	STZ YOUR_SANCTUARY_LOADED_TILESET_TILES
	LDA $04
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $1C
	LDA $02
	LSR
	LSR
	LSR
	LSR
	TAX
	LOADPTR GLOBAL_MAP_TILESETPALETTE_DATA, $06
	LDA $1C
	STA $02
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAY
	STY $1A
	LDA $04
	LSR
	LSR
	LSR
	LSR
	LSR
	PHA
	LDA $1E
	STA $02
	LSR
	LSR
	AND #$FFFC
	ASL
	ASL
	ASL
	PLX
	STX $02
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	LSR
	LSR
	LSR
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA UNKNOWN_7E436E
	LDX $20
	TYA
	JSR PREPARE_YOUR_SANCTUARY_LOCATION_PALETTE_DATA
	LOADPTR TILESET_TABLE, $0A
	LDY $1A
	TYA
	LSR
	LSR
	LSR
	ASL
	CLC
	ADC $0A
	STA $0A
	LOADPTR UNKNOWN_7F8000, $06
	MOVE_INT $06, $16
	LOADPTR MAP_DATA_TILE_ARRANGEMENT_PTR_TABLE, $06
	LDA [$0A]
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	JSL DECOMP
	LDY $20
	LDA $1E
	STA $02
	LDX $02
	LDA $04
	JSR PREPARE_YOUR_SANCTUARY_LOCATION_TILE_ARRANGEMENT_DATA
	.IF .DEFINED(JPN)
		LOADPTR MAP_DATA_TILESET_PTR_TABLE, $06
		LDA [$0A]
		ASL
		ASL
		CLC
		ADC $06
		STA $06
		DEREFERENCE_PTR_TO $06, $0A
		MOVE_INT $0A, $0E
	.ELSE
		LDA [$0A]
		ASL
		ASL
		PHA
		LOADPTR MAP_DATA_TILESET_PTR_TABLE, $0A
		PLA
		CLC
		ADC $0A
		STA $0A
		DEREFERENCE_PTR_TO $0A, $06
		MOVE_INT $06, $0E
	.ENDIF
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	JSL DECOMP
	LDA $20
	JSR PREPARE_YOUR_SANCTUARY_LOCATION_TILESET_DATA
	LDA TOTAL_YOUR_SANCTUARY_LOADED_TILESET_TILES
	CLC
	ADC YOUR_SANCTUARY_LOADED_TILESET_TILES
	STA TOTAL_YOUR_SANCTUARY_LOADED_TILESET_TILES
	PLD
	RTS
