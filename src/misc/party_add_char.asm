
ADD_CHAR_TO_PARTY: ;$C228F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $04
	LDA #$0000
	STA $02
	STA $0E
	JMP @UNKNOWN14
@UNKNOWN0:
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA GAME_STATE + game_state::party_members,X
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	CMP $04
	BEQL @UNKNOWN16
	CMP $04
	BGT @UNKNOWN3
	LDA $00
	AND #$00FF
	BNE @UNKNOWN13
@UNKNOWN3:
	LDY $02
	BRA @UNKNOWN7
@UNKNOWN4:
	STY $02
	LDA #$0006
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN16
	INY
@UNKNOWN7:
	LDA GAME_STATE + game_state::party_members,Y
	AND #$00FF
	BNE @UNKNOWN4
	BRA @UNKNOWN9
@UNKNOWN8:
	TYX
	DEX
	SEP #PROC_FLAGS::ACCUM8
	LDA GAME_STATE + game_state::party_members,X
	STA GAME_STATE + game_state::party_members,Y
	TXY
@UNKNOWN9:
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	STA $02
	TYA
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN8
	LDA $04
	SEP #PROC_FLAGS::ACCUM8
	LDX $02
	STA GAME_STATE + game_state::party_members,X
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	JSL UNKNOWN_C0369B
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA __BSS_START__,X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA __BSS_START__,X
	LDA $04
	CMP #$0004
	BGT @UNKNOWN16
	JSL UNKNOWN_C216DB
	JSL UNKNOWN_C3EBCA
	BRA @UNKNOWN16
@UNKNOWN13:
	INC $02
	LDA $02
	STA $0E
@UNKNOWN14:
	LDA #$0006
	CLC
	SBC $02
	JUMPGTS @UNKNOWN0
@UNKNOWN16:
	PLD
	RTL
