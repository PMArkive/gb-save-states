;***************************************************************************;
;
; Calls the relocated_read_from_joypad fuction in a different ROM bank, 
; restoring the previous ROM bank afterwards.
;
;***************************************************************************

.DEFINE interrupts_already_disabled 1
.DEFINE already_changed_rom_bank 1


invoke_relocated_read_from_joypad_in_other_bank:


.IFDEF preserve_register_a
    ld b,a
.ENDIF


.IFNDEF calling_from_vblank
    ; disable interrupts
    ld a,($ff00+$ff)   
    push af            
    xor a              
    ld ($ff00+$ff),a   
.ENDIF

.IFDEF current_rom_bank
    ; save current ROM bank
    ld a,(current_rom_bank)
    push af

    ld a,:relocated_read_from_joypad
    ld ($2000),a
.ENDIF

    jp invoke_relocated_read_from_joypad_in_other_bank_part_2