
UNKNOWN_C0A055: ;$C0A055
	LDX $88
	LDA ENTITY_ABS_X_TABLE,X
	SEC
	SBC BG3_X_POS
	STA ENTITY_SCREEN_X_TABLE,X
	LDA ENTITY_ABS_Y_TABLE,X
	SEC
	SBC BG3_Y_POS
	STA ENTITY_SCREEN_Y_TABLE,X
	RTS
