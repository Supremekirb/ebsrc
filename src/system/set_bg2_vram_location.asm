
SET_BG2_VRAM_LOCATION: ;$C08DDE
	PHP
	SEP #PROC_FLAGS::ACCUM8
	REP #PROC_FLAGS::INDEX8
	AND #$0003
	STA UNKNOWN_7E0011+1
	REP #PROC_FLAGS::ACCUM8
	TXA
	XBA
	SEP #PROC_FLAGS::ACCUM8
	AND #$00FC
	ORA UNKNOWN_7E0011+1
	STA UNKNOWN_7E0011+1
	STA f:BG2SC
	LDA BG12NBA_MIRROR
	AND #$000F
	STA BG12NBA_MIRROR
	REP #PROC_FLAGS::ACCUM8
	STZ BG2_X_POS
	STZ BG2_Y_POS
	TYA
	XBA
	SEP #PROC_FLAGS::ACCUM8
	AND #$00F0
	ORA BG12NBA_MIRROR
	STA BG12NBA_MIRROR
	STA f:BG12NBA
	PLP
	RTL
