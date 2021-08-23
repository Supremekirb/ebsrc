
;void RefreshMapAtPos(int x, int y)
REFRESH_MAP_AT_POSITION: ;$C01558
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STX $14
	STA $12
	STA a:.LOWORD(BG2_X_POS)
	LDA $12
	STA a:.LOWORD(BG1_X_POS)
	LDA $14
	STA a:.LOWORD(BG2_Y_POS)
	LDA $14
	STA a:.LOWORD(BG1_Y_POS)
	LDA $12
	AND #$8000
	BEQ @UNKNOWN0
	LDA $12
	LSR
	LSR
	LSR
	ORA #$E000
	STA $04
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $12
	LSR
	LSR
	LSR
	STA $04
@UNKNOWN1:
	LDA $14
	AND #$8000
	BEQ @UNKNOWN2
	LDA $14
	LSR
	LSR
	LSR
	ORA #$E000
	STA $02
	JMP @UNKNOWN5
@UNKNOWN2:
	LDA $14
	LSR
	LSR
	LSR
	STA $02
	JMP @UNKNOWN5
@UNKNOWN3:
	AND #$8000
	BEQ @UNKNOWN4
	LDA .LOWORD(UNKNOWN_7E4374)
	INC
	STA $10
	STA .LOWORD(UNKNOWN_7E4374)
	LDA $02
	SEC
	SBC #$0010
	TAY
	STY $0E
	TYX
	LDA $10
	CLC
	ADC #$0029
	JSR a:.LOWORD(UNKNOWN_C00BDC)
	LDY $0E
	TYX
	LDA .LOWORD(UNKNOWN_7E4374)
	CLC
	ADC #$0029
	JSR a:.LOWORD(UNKNOWN_C00D7E)
	LDX $02
	LDA .LOWORD(UNKNOWN_7E4374)
	CLC
	ADC #$0020
	JSR a:.LOWORD(UNKNOWN_C00FCB)
	LDX $02
	DEX
	LDA .LOWORD(UNKNOWN_7E4374)
	CLC
	ADC #$0022
	JSL UNKNOWN_C025CF
	LDA $02
	SEC
	SBC #$0008
	TAX
	LDA .LOWORD(UNKNOWN_7E4374)
	CLC
	ADC #$0028
	JSL SPAWN_VERTICAL
	BRA @UNKNOWN5
@UNKNOWN4:
	LDA .LOWORD(UNKNOWN_7E4374)
	DEC
	STA $0E
	STA .LOWORD(UNKNOWN_7E4374)
	LDA $02
	SEC
	SBC #$0010
	TAY
	STY $10
	TYX
	LDA $0E
	SEC
	SBC #$0010
	JSR a:.LOWORD(UNKNOWN_C00BDC)
	LDY $10
	TYX
	LDA .LOWORD(UNKNOWN_7E4374)
	SEC
	SBC #$0010
	JSR a:.LOWORD(UNKNOWN_C00D7E)
	LDX $02
	LDA .LOWORD(UNKNOWN_7E4374)
	DEC
	JSR a:.LOWORD(UNKNOWN_C00FCB)
	LDX $02
	DEX
	LDA .LOWORD(UNKNOWN_7E4374)
	DEC
	DEC
	DEC
	JSL UNKNOWN_C025CF
	LDA $02
	SEC
	SBC #$0008
	TAX
	LDA .LOWORD(UNKNOWN_7E4374)
	SEC
	SBC #$0008
	JSL SPAWN_VERTICAL
@UNKNOWN5:
	LDA .LOWORD(UNKNOWN_7E4374)
	SEC
	SBC $04
	BEQ @UNKNOWN6
	JMP @UNKNOWN3
@UNKNOWN6:
	JMP @UNKNOWN9
@UNKNOWN7:
	AND #$8000
	BEQ @UNKNOWN8
	LDA .LOWORD(UNKNOWN_7E4376)
	INC
	STA $10
	STA .LOWORD(UNKNOWN_7E4376)
	LDA $04
	SEC
	SBC #$0010
	TAY
	STY $0E
	LDA $10
	CLC
	ADC #$0029
	TAX
	TYA
	JSR a:.LOWORD(UNKNOWN_C00AC5)
	LDA .LOWORD(UNKNOWN_7E4376)
	CLC
	ADC #$0029
	TAX
	LDY $0E
	TYA
	JSR a:.LOWORD(UNKNOWN_C00CF3)
	LDA .LOWORD(UNKNOWN_7E4376)
	CLC
	ADC #$001C
	TAX
	LDA $04
	JSR a:.LOWORD(UNKNOWN_C00E16)
	LDA .LOWORD(UNKNOWN_7E4376)
	CLC
	ADC #$001D
	TAX
	LDA $04
	JSL UNKNOWN_C0255C
	LDA .LOWORD(UNKNOWN_7E4376)
	CLC
	ADC #$0024
	TAX
	LDA $04
	SEC
	SBC #$0008
	JSL SPAWN_HORIZONTAL
	BRA @UNKNOWN9
@UNKNOWN8:
	LDA .LOWORD(UNKNOWN_7E4376)
	DEC
	STA $10
	STA .LOWORD(UNKNOWN_7E4376)
	LDA $04
	SEC
	SBC #$0010
	TAY
	STY $0E
	LDA $10
	SEC
	SBC #$0010
	TAX
	TYA
	JSR a:.LOWORD(UNKNOWN_C00AC5)
	LDA .LOWORD(UNKNOWN_7E4376)
	SEC
	SBC #$0010
	TAX
	LDY $0E
	TYA
	JSR a:.LOWORD(UNKNOWN_C00CF3)
	LDX .LOWORD(UNKNOWN_7E4376)
	DEX
	LDA $04
	JSR a:.LOWORD(UNKNOWN_C00E16)
	LDX .LOWORD(UNKNOWN_7E4376)
	DEX
	LDA $04
	JSL UNKNOWN_C0255C
	LDA .LOWORD(UNKNOWN_7E4376)
	SEC
	SBC #$0008
	TAX
	LDA $04
	SEC
	SBC #$0008
	JSL SPAWN_HORIZONTAL
@UNKNOWN9:
	LDA .LOWORD(UNKNOWN_7E4376)
	SEC
	SBC $02
	BEQ @UNKNOWN10
	JMP @UNKNOWN7
@UNKNOWN10:
	LDA $12
	STA .LOWORD(UNKNOWN_7E4386)
	LDA $14
	STA .LOWORD(UNKNOWN_7E4388)
	PLD
	RTS
