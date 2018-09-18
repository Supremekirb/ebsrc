.SEGMENT "BANK17"
.INCLUDE "common.asm"
.ORG $D70000

MAP_DATA_TILE_TABLE_BANK_2: ;$D70000
	.INCBIN "bin/unknowns/D70000.bin"

MAP_DATA_LOCAL_TILESET_TABLE: ;$D75000
	.INCBIN "bin/unknowns/D75000.bin"

GLOBAL_MAP_TILESETPALETTE_DATA: ;$D7A800
	.INCBIN "bin/unknowns/D7A800.bin"

MAP_DATA_PER_SECTOR_ATTRIBUTES_TABLE: ;$D7B200
	.INCBIN "bin/unknowns/D7B200.bin"

MAP_DATA_TILE_ARRANGEMENT_0: ;$D7B200
	.INCBIN "bin/maps/arrangements/0.bin"
