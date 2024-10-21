; md5 211a15218fa66e4a09bc253ae064991c

; ROMBANKS 16
; ROM "Defender-Joust (U) [S][!].gb"


;**********
;* config *
;**********

DEF joypad EQU $ffbe
DEF swap_joypad EQU 1
DEF current_rom_bank EQU $7fff


;*************
;* reset ram *
;*************

DEF RESET_RAM_DONE EQU $0181

SECTION "reset ram", ROM0[$00b9] ; length: $F
    INCLUDE "includes/reset_ram.asm"
ENDSECTION

SECTION "reset ram jump", ROM0[$0101] ; length: 3
    jp RESET_RAM
ENDSECTION


;***************
;* joypad read *
;***************

SECTION "relocated read from joypad", ROM0[$0079] ; length: $40
    INCLUDE "includes/relocated_read_from_joypad.asm"
ENDSECTION

SECTION "joypad read", ROM0[$0add] ; length: 4
    call relocated_read_from_joypad
    nop
ENDSECTION


;*******************
;* save/load state *
;*******************

SECTION "save/load state", ROMX[$4000], BANK[$0008] ; length: $0220
    DB "--- Save Patch ---"
    INCLUDE "includes/save_state_includes.asm"
ENDSECTION

SECTION "new bank", ROMX[$7FFF], BANK[$0008] ; length: 1
    DB $8
ENDSECTION


; Generated with patch-builder.py
