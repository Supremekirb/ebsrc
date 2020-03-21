
FIND_INVENTORY_SPACE2: ;$C4572B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	CMP #$00FF
	BNE @UNKNOWN3
	LDY #$0000
	STY $10
	BRA @UNKNOWN2
@UNKNOWN0:
	TYA
	CLC
	ADC #.LOWORD(GAME_STATE) + 122
	TAX
	STX $0E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	JSR a:.LOWORD(FIND_INVENTORY_SPACE)
	CMP #$0000
	BEQ @UNKNOWN1
	LDX $0E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BRA @UNKNOWN4
@UNKNOWN1:
	LDY $10
	INY
	STY $10
@UNKNOWN2:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BCC @UNKNOWN0
	LDA #$0000
	BRA @UNKNOWN4
@UNKNOWN3:
	JSR a:.LOWORD(FIND_INVENTORY_SPACE)
@UNKNOWN4:
	PLD
	RTL
