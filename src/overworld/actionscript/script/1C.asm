
MOVEMENT_CODE_1C: ;$C09B4D
	LDX $88
	LDA [$80],Y
	STA ENTITY_SPRITEMAP_POINTER_LOW,X
	INY
	INY
	SEP #PROC_FLAGS::ACCUM8
	LDA [$80],Y
	STA ENTITY_SPRITEMAP_POINTER_HIGH,X
	REP #PROC_FLAGS::ACCUM8
	INY
	RTS
