
UNKNOWN_C2DB14: ;$C2DB14
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA LOADED_BG_DATA_LAYER1 + loaded_bg_data::palette_pointer
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(loaded_bg_data::palette)
	LDA #.LOWORD(LOADED_BG_DATA_LAYER1) + loaded_bg_data::palette
	JSL MEMCPY16
	PLD
	RTL
