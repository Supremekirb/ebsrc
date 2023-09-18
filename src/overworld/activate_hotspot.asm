
ACTIVATE_HOTSPOT: ;$C072CF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	STX $1C
	STA $1A
	MOVE_INT $2C, $0A
	LOADPTR MAP_HOTSPOTS, $06
	LDA $1C
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $16
	LDA $08
	STA $18
	LDA $1A
	DEC
	OPTIMIZED_MULT $04, .SIZEOF(active_hotspot)
	CLC
	ADC #.LOWORD(ACTIVE_HOTSPOTS)
	TAY
	STY $14
	LDA GAME_STATE+game_state::leader_x_coord
	STA $12
	LDX GAME_STATE+game_state::leader_y_coord
	LDA [$06]
	ASL
	ASL
	ASL
	STA $10
	MOVE_INT $16, $06
	LDY #$0002
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA $0E
	LDY #$0004
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA $02
	LDY #$0006
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA $04
	LDA $12
	CMP $10
	BLTEQ @UNKNOWN0
	CMP $02
	BCS @UNKNOWN0
	CPX $0E
	BLTEQ @UNKNOWN0
	TXA
	CMP $04
	BCS @UNKNOWN0
	LDX #$0001
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0002
@UNKNOWN1:
	TXA
	LDY $14
	STA a:active_hotspot::mode,Y
	LDA $10
	STA a:active_hotspot::x1,Y
	LDA $02
	STA a:active_hotspot::x2,Y
	LDA $0E
	STA a:active_hotspot::y1,Y
	LDA $04
	STA a:active_hotspot::y2,Y
	TYA
	CLC
	ADC #active_hotspot::pointer
	TAY
	MOVE_INT_YPTRDEST $0A, __BSS_START__
	LDA $1A
	DEC
	STA $12
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAY
	TXA
	SEP #PROC_FLAGS::ACCUM8
	STA __BSS_START__ + game_state::active_hotspot_modes,Y
	REP #PROC_FLAGS::ACCUM8
	LDA $1C
	SEP #PROC_FLAGS::ACCUM8
	STA __BSS_START__+game_state::active_hotspot_ids,Y
	REP #PROC_FLAGS::ACCUM8
	LDA $12
	ASL
	ASL
	CLC
.IF .DEFINED(JPN)
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC #game_state::active_hotspot_pointers
.ELSE
	ADC #.LOWORD(GAME_STATE) + game_state::active_hotspot_pointers
.ENDIF
	TAY
	MOVE_INT_YPTRDEST $0A, __BSS_START__
	PLD
	RTL
