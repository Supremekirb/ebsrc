
STATUS_EQUIP_WINDOW_TEXT: ;$C45A27
STATUS_EQUIP_WINDOW_TEXT_1:
	.BYTE $07, $00, $60, $01, $61, $01, $62, $01, $63, $01, $64, $01, $65, $01
	.BYTE $66, $01, $67, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $68, $01, $69, $01, $07, $00, $07, $00, $07, $00, $00, $00, $00, $00
	.BYTE $6A, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $07, $00, $07, $00, $07, $00, $07, $00, $00, $00, $00, $00, $00, $00
STATUS_EQUIP_WINDOW_TEXT_2:
	.BYTE $20, $00, $0D, $00, $0E, $00, $0F, $00, $1D, $00, $1E, $00, $1F, $00
	.BYTE $1C, $00, $2F, $01, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	.BYTE $0C, $00, $3F, $01, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	.BYTE $0B, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	.BYTE $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	.BYTE $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	.BYTE $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $00, $00
STATUS_EQUIP_WINDOW_TEXT_3:
	.BYTE $02, $00, $06, $00, $06, $00, $06, $00, $06, $00, $06, $00, $06, $00
	.BYTE $06, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $06, $00, $06, $00, $06, $00, $06, $00, $06, $00, $00, $00, $00, $00
	.BYTE $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.BYTE $04, $00, $04, $00, $04, $00, $04, $00, $00, $00, $00, $00, $00, $00
.IF .DEFINED(JPN)
STATUS_EQUIP_WINDOW_TEXT_4:
	PADDEDASCII "\x40\x41\xFA\xB6\xED\x97\x20\x50\x53\x49\xA8\x94\x86\x9C\x70\x9E\x20\x7C\x8F\xA2\xA6\x63\x97\x72\x6C\x84\x5F", 27
STATUS_EQUIP_WINDOW_TEXT_5:
	PADDEDASCII "\x72\x95\x86\x74\x96\x70\x8F", 10
	PADDEDASCII "\xB7\xC0\xBD\x78\x68\x7E\x96\x70\x8F", 10
	PADDEDASCII "\x74\x7A\x9F\x96\x70\x8F", 10
	PADDEDASCII "\x72\xAC\x76\x63\x7D\x8F\x70", 10
	PADDEDASCII "\xA7\x82\x78\x82\x8F\x74\x9D\x97\x8F", 10
	PADDEDASCII "\x78\x7E\x74\x6E\x7A\xAE\x80", 10
	PADDEDASCII "\x62\x95\x9E\x79\x70\x96\x70\x8F", 10
	PADDEDASCII "\x72\xA8\xA2\x63\x69\x90\x96\x70\x8F", 10
	PADDEDASCII "\xA6\x7F\x86\x62\x9F\x96\x70\x8F", 10
STATUS_EQUIP_WINDOW_TEXT_6:
	PADDEDASCII "\xF9\x25\xDC\xC4\xCE\xD2", 10
STATUS_EQUIP_WINDOW_TEXT_7:
	PADDEDASCII "\x60\x85\x62\x7F\xAC\xA8", 6
STATUS_EQUIP_WINDOW_TEXT_8:
	PADDEDASCII "\xF0\xD9\xE1\xED\xD4\x5B", 6
STATUS_EQUIP_WINDOW_TEXT_9:
	PADDEDASCII "\xE7\xC1\xD9\xE1\xED\xD4\x5B", 7
STATUS_EQUIP_WINDOW_TEXT_10:
STATUS_EQUIP_WINDOW_TEXT_11:
	PADDEDASCII "\x8A\x72", 4
	PADDEDASCII "\xFA\xE7\xC1", 4
	PADDEDASCII "\x80\x97", 4
	PADDEDASCII "\xA4\xA8\x66", 4
STATUS_EQUIP_WINDOW_TEXT_12:
	PADDEDASCII "\x3A\x68\x74\x3B", 4
STATUS_EQUIP_WINDOW_TEXT_13:
	PADDEDASCII "\xA4\x80\x7A\x74\x68\x70", 7
STATUS_EQUIP_WINDOW_TEXT_14:
	PADDEDASCII "\x6A\x74\xAE", 3
.ELSE
STATUS_EQUIP_WINDOW_TEXT_4:
	PADDEDEBTEXT "@Press the -A- Button for PSI info.", 35
STATUS_EQUIP_WINDOW_TEXT_5:
	PADDEDEBTEXT "Unconscious", 16
	PADDEDEBTEXT "Diamondized", 16
	PADDEDEBTEXT "Paralyzed", 16
	PADDEDEBTEXT "Nauseous", 16
	PADDEDEBTEXT "Poisoned", 16
	PADDEDEBTEXT "Sunstroke", 16
	PADDEDEBTEXT "Sniffling", 16
	PADDEDEBTEXT "Mashroomized", 16
	PADDEDEBTEXT "Possessed", 16
STATUS_EQUIP_WINDOW_TEXT_6:
	PADDEDEBTEXT "Homesick", 16
STATUS_EQUIP_WINDOW_TEXT_7:
	PADDEDEBTEXT "Stored Goods", 12
STATUS_EQUIP_WINDOW_TEXT_8:
	PADDEDEBTEXT "Offense:", 8
STATUS_EQUIP_WINDOW_TEXT_9:
	PADDEDEBTEXT "Defense:", 8
STATUS_EQUIP_WINDOW_TEXT_10:
	PADDEDEBTEXT "  Weapon", 11
	PADDEDEBTEXT "      Body", 11
	PADDEDEBTEXT "     Arms", 11
	PADDEDEBTEXT "     Other", 11
STATUS_EQUIP_WINDOW_TEXT_11:
	PADDEDEBTEXT "Weapons", 8
	PADDEDEBTEXT "Body", 8
	PADDEDEBTEXT "Arms", 8
	PADDEDEBTEXT "Others", 8
STATUS_EQUIP_WINDOW_TEXT_12:
	PADDEDEBTEXT "(Nothing) ", 10
STATUS_EQUIP_WINDOW_TEXT_13:
	PADDEDEBTEXT "None", 5
STATUS_EQUIP_WINDOW_TEXT_14:
	PADDEDEBTEXT "To:", 3
.ENDIF
