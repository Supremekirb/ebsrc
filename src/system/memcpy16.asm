
MEMCPY16: ;$C08ED2
	STX UNKNOWN_7E00A5
	LSR UNKNOWN_7E00A5
	TAX
	LDY #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA [$0E],Y
	STA __BSS_START__,X
	INX
	INX
	INY
	INY
@UNKNOWN1:
	DEC UNKNOWN_7E00A5
	BPL @UNKNOWN0
	RTL
