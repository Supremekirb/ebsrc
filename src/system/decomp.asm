
DECOMP: ;$C41A9E
	MOVE_INT $0E, UNKNOWN_7E00CC
	LDX $12
	STX UNKNOWN_7E00CF
	PHB
	SEP #PROC_FLAGS::ACCUM8
	LDA $14
	PHA
	PLB
	REP #PROC_FLAGS::ACCUM8
	PHD
	PEA $0000
	PLD
	PHP
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0000
DECOMP_UNKNOWN0:
	LDA [<UNKNOWN_7E00CC],Y
	CMP #$00FF
	BNE DECOMP_UNKNOWN1
	PLP
	PLD
	PLB
	RTL
DECOMP_UNKNOWN1:
	AND #$00E0
	CMP #$00E0
	BNE DECOMP_UNKNOWN2
	LDA [<UNKNOWN_7E00CC],Y
	ASL
	ASL
	ASL
	AND #$00E0
	PHA
	LDA [<UNKNOWN_7E00CC],Y
	INY
	AND #$0003
	STA <UNKNOWN_7E00D2
	LDA [<UNKNOWN_7E00CC],Y
	INY
	STA <UNKNOWN_7E00D1
	REP #PROC_FLAGS::ACCUM8
	INC <UNKNOWN_7E00D1
	SEP #PROC_FLAGS::ACCUM8
	BRA DECOMP_UNKNOWN3
DECOMP_UNKNOWN2:
	PHA
	LDA [<UNKNOWN_7E00CC],Y
	INY
	AND #$001F
	INC
	STA <UNKNOWN_7E00D1
	STZ <UNKNOWN_7E00D2
DECOMP_UNKNOWN3:
	PLA
	BPL DECOMP_UNKNOWN4
	JMP DECOMP_UNKNOWN12
DECOMP_UNKNOWN4:
	CMP #$0020
	BEQ DECOMP_UNKNOWN6
	CMP #$0040
	BEQ DECOMP_UNKNOWN8
	CMP #$0060
	BEQ DECOMP_UNKNOWN10
DECOMP_UNKNOWN5:
	LDA [<UNKNOWN_7E00CC],Y
	INY
	STA __BSS_START__,X
	INX
	REP #PROC_FLAGS::ACCUM8
	DEC <UNKNOWN_7E00D1
	SEP #PROC_FLAGS::ACCUM8
	BNE DECOMP_UNKNOWN5
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN6:
	LDA [<UNKNOWN_7E00CC],Y
	INY
	PHY
	LDY <UNKNOWN_7E00D1 + 0
DECOMP_UNKNOWN7:
	STA __BSS_START__,X
	INX
	DEY
	BNE DECOMP_UNKNOWN7
	PLY
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN8:
	REP #PROC_FLAGS::ACCUM8
	LDA [<UNKNOWN_7E00CC],Y
	INY
	INY
	PHY
	LDY <UNKNOWN_7E00D1 + 0
DECOMP_UNKNOWN9:
	STA __BSS_START__,X
	INX
	INX
	DEY
	BNE DECOMP_UNKNOWN9
	PLY
	SEP #PROC_FLAGS::ACCUM8
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN10:
	LDA [<UNKNOWN_7E00CC],Y
	INY
	PHY
	LDY <UNKNOWN_7E00D1 + 0
DECOMP_UNKNOWN11:
	STA __BSS_START__,X
	INX
	INC
	DEY
	BNE DECOMP_UNKNOWN11
	PLY
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN12:
	STA <UNKNOWN_7E00D3
	REP #PROC_FLAGS::ACCUM8
	LDA [<UNKNOWN_7E00CC],Y
	XBA
	CLC
	ADC <UNKNOWN_7E00CF + 0
	INY
	INY
	PHY
	TAY
	SEP #PROC_FLAGS::ACCUM8
	LDA <UNKNOWN_7E00D3 + 0
	CMP #$0080
	BEQ DECOMP_UNKNOWN13
	CMP #$00A0
	BEQ DECOMP_UNKNOWN14
	CMP #$00C0
	BEQ DECOMP_UNKNOWN15
DECOMP_UNKNOWN13:
	LDA __BSS_START__,Y
	STA __BSS_START__,X
	INY
	INX
	REP #PROC_FLAGS::ACCUM8
	DEC <UNKNOWN_7E00D1
	SEP #PROC_FLAGS::ACCUM8
	BNE DECOMP_UNKNOWN13
	PLY
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN14:
	LDA __BSS_START__,Y
	STA <UNKNOWN_7E00D3
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	ASL <UNKNOWN_7E00D3
	ROR
	STA __BSS_START__,X
	INY
	INX
	REP #PROC_FLAGS::ACCUM8
	DEC <UNKNOWN_7E00D1
	SEP #PROC_FLAGS::ACCUM8
	BNE DECOMP_UNKNOWN14
	PLY
	JMP DECOMP_UNKNOWN0
DECOMP_UNKNOWN15:
	 LDA __BSS_START__,Y
	 STA __BSS_START__,X
	 DEY
	 INX
	 REP #PROC_FLAGS::ACCUM8
	 DEC <UNKNOWN_7E00D1
	 SEP #PROC_FLAGS::ACCUM8
	 BNE DECOMP_UNKNOWN15
	 PLY
	 JMP DECOMP_UNKNOWN0
DECOMP_ENTRY2:
	 REP #PROC_FLAGS::ACCUM8
	 PHD
	 PHA
	 TDC
	 SEC
	 SBC #$000C
	 TCD
	 PLA
	 STA $00
	 STX $02
	 STY $04
	 LDA #$00E1
	 STA $08
	 LDA $00
DECOMP_UNKNOWN16:
	SEC
	SBC #$071C
	BCC DECOMP_UNKNOWN17
	INC $08
	BRA DECOMP_UNKNOWN16
DECOMP_UNKNOWN17:
	ADC #$071C
	STA $00
	LDA $00
	SEP #PROC_FLAGS::ACCUM8
	PHA
	LDA #$0012
	REP #PROC_FLAGS::ACCUM8
	STA f:WRMPYA
	NOP
	CLC
	LDA f:RDMPYL
	TAX
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA f:WRMPYB
	TXA
	XBA
	REP #PROC_FLAGS::ACCUM8
	ADC f:RDMPYL
	CLC
	ADC #$0000
	STA $06
	LDY #$0000
	LDA $04
	BNE DECOMP_UNKNOWN19
	LDY #$0000
DECOMP_UNKNOWN18:
	LDA [$06]
	AND #$F0FF
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	LDA [$06]
	XBA
	ASL
	ASL
	ASL
	ASL
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN18
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN19:
	DEC
	BNE DECOMP_UNKNOWN21
DECOMP_UNKNOWN20:
	LDA [$06]
	XBA
	LSR
	AND #$7FF8
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	LDA [$06]
	XBA
	ASL
	ASL
	ASL
	AND #$7FF8
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN20
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN21:
	DEC
	BNE DECOMP_UNKNOWN23
DECOMP_UNKNOWN22:
	LDA [$06]
	XBA
	LSR
	LSR
	AND #$3FFC
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	LDA [$06]
	XBA
	ASL
	ASL
	AND #$3FFC
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN22
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN23:
	DEC
	BNE DECOMP_UNKNOWN25
DECOMP_UNKNOWN24:
	LDA [$06]
	XBA
	LSR
	LSR
	LSR
	AND #$1FFE
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	LDA [$06]
	XBA
	ASL
	AND #$1FFE
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN24
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN25:
	DEC
	BNE DECOMP_UNKNOWN27
DECOMP_UNKNOWN26:
	LDA [$06]
	XBA
	LSR
	LSR
	LSR
	LSR
	XBA
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	LDA [$06]
	AND #$FF0F
	STA ($02),Y
	INY
	INY
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN26
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN27:
	DEC
	BNE DECOMP_UNKNOWN29
DECOMP_UNKNOWN28:
	STZ $0A
	LDA [$06]
	XBA
	LSR
	LSR
	LSR
	LSR
	LSR
	ROR $0A
	XBA
	STA ($02),Y
	INY
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INC $06
	STZ $0A
	LDA [$06]
	XBA
	LSR
	ROR $0A
	XBA
	STA ($02),Y
	INY
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN28
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN29:
	DEC
	BNE DECOMP_UNKNOWN31
DECOMP_UNKNOWN30:
	LDA [$06]
	XBA
	STA $0A
	LDA #$0000
	ASL $0A
	ROL
	ASL $0A
	ROL
	STA ($02),Y
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INY
	INC $06
	STZ $0A
	LDA [$06]
	XBA
	LSR
	ROR $0A
	LSR
	ROR $0A
	XBA
	STA ($02),Y
	INY
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN30
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
DECOMP_UNKNOWN31:
	LDA [$06]
	XBA
	STA $0A
	LDA #$0000
	ASL $0A
	ROL
	STA ($02),Y
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INY
	INC $06
	STZ $0A
	LDA [$06]
	XBA
	LSR
	ROR $0A
	LSR
	ROR $0A
	LSR
	ROR $0A
	XBA
	STA ($02),Y
	INY
	INY
	LDA $0A
	XBA
	STA ($02),Y
	INY
	INC $06
	INC $06
	CPY #$0024
	BCC DECOMP_UNKNOWN31
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTS
