
ADD_CHAR_TO_PARTY: ;$C228F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAY
	STY $12
	LDA #$0000
	STA $02
	JMP @UNKNOWN14
@UNKNOWN0:
	LDA $02
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:game_state::party_members,X
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	STY $04
	CMP $04
	BEQL @UNKNOWN16
	STY $04
	CMP $04
	BGT @UNKNOWN3
	LDA $00
	AND #$00FF
	BNEL @UNKNOWN13
@UNKNOWN3:
	LDX $02
	STX $10
	BRA @UNKNOWN7
@UNKNOWN4:
	LDX $10
	STX $04
	LDA #$0006
	CLC
	SBC $04
	JUMPLTEQS @UNKNOWN16
	INX
	STX $10
@UNKNOWN7:
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	BNE @UNKNOWN4
	BRA @UNKNOWN9
@UNKNOWN8:
	TXA
	DEC
	STA $0E
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	PHA
	LDA $0E
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:game_state::party_members,X
	PLX
	STA a:game_state::party_members,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	TAX
	STX $10
@UNKNOWN9:
	LDX $10
	TXA
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN8
	LDA $02
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA a:game_state::party_members,X
	REP #PROC_FLAGS::ACCUM8
	TYA
	JSL UNKNOWN_C0369B
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA __BSS_START__,X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA __BSS_START__,X
	LDY $12
	CPY #$0004
	BGT @UNKNOWN16
	JSL UNKNOWN_C216DB
	JSL UNKNOWN_C3EBCA
	BRA @UNKNOWN16
@UNKNOWN13:
	INC $02
@UNKNOWN14:
	LDA #$0006
	CLC
	SBC $02
	JUMPGTS @UNKNOWN0
@UNKNOWN16:
	PLD
	RTL
