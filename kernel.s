; by Menshikov S., 2025
; use under Unlicense or CC0

.orig 0
; memory starts at 1000
.byte 1000
.byte 0
.byte 0

.byte 0
.byte 100000
.byte 0
.orig 27

open 0
mov UR0, 0
vsv UR0, 1998
mov UR0, 1
vsv UR0, 1999

mov UR0, 1000
mov UR1, 33767
mov UR2, <halt>
mov UR3, 1000
mov UR23, 0
mov UR21, 0
mov UR22, 32768
mov UR5, 65535

loop:
    if UR0 > UR1, UR2
    ild UR0, UR10
    and UR10 UR5, UR10
    inc UR0
    ild UR0, UR11
    and UR11 UR5, UR11
    inc UR0
    ild UR0, UR12
    and UR12 UR5, UR12
    inc UR0
    
    mov UR6, <getchar>
    if UR10 = UR5, UR6
    mov UR6, <putchar>
    if UR11 = UR5, UR6
    
    add UR10 UR3, UR7
    ild UR7, UR7
    add UR11 UR3, UR8
    ild UR8, UR8
    sub UR8 UR7, UR7
    and UR7 UR5, UR7
    add UR11 UR3, UR8
    isv UR7, UR8
    
    mov UR11, <setpc>
    if UR7 = UR21, UR11
    and UR7 UR22, UR7
    if UR7 = UR22, UR11
    
    mov UR10, <loop>
    jmp UR10
setpc:
    add UR12 UR3, UR12
    ld UR12, UR0
    
    mov UR10, <loop>
    jmp UR10
getchar:
    mov UR13, 9608
    vsv UR13, UR23
    mov UR13, 1
    vsv UR13, 1901
getchar_loop:
    nop
    vld 1900, UR13
    mov UR15, <getchar_loop>
    mov UR14, 0
    if UR13 = UR14, UR15
    if UR13 = UR5, UR15
    mov UR15, <getchar_backspace>
    mov UR14, 8
    if UR13 = UR14, UR15
    mov UR15, <getchar_newline>
    mov UR14, 10
    if UR13 = UR14, UR15
    
    vsv UR13, UR23
    inc UR23
getchar_continue:
    mov UR14, 0
    vsv UR14, 1900
    add UR11 UR3, UR7
    isv UR13, UR7
    mov UR13, 1
    vsv UR13, 1901
    mov UR10, <loop>
    jmp UR10
getchar_backspace:
    mov UR10, 0
    vsv UR10, UR23
    dec UR23
    vsv UR10, UR23
    mov UR10, <getchar_continue>
    jmp UR10
getchar_newline:
    mov UR10, 0
    vsv UR10, UR23
    mov UR10, 63
    rem UR23 UR10, UR15
    sub UR10 UR15, UR10
    add UR23 UR10, UR23
    mov UR10, <getchar_continue>
    jmp UR10
putchar:
    add UR10 UR3, UR7
    ild UR7, UR7
    
    mov UR10, 1764
    mov UR15, <putchar_continue>
    if UR23 < UR10, UR15
    mov UR10, 1
    vsv UR10, 1902
    mov UR23, 0
putchar_continue:
    mov UR15, <putchar_backspace>
    mov UR10, 8
    if UR7 = UR10, UR15
    mov UR15, <putchar_newline>
    mov UR10, 10
    if UR7 = UR10, UR15
    mov UR15, <putchar_cr>
    mov UR10, 13
    if UR7 = UR10, UR15
    
    vsv UR7, UR23
    inc UR23
    mov UR13, 1
    vsv UR13, 1901
    mov UR10, <loop>
    jmp UR10
putchar_backspace:
    dec UR23
    mov UR10, <loop>
    jmp UR10
putchar_cr:
    mov UR10, 63
    sub UR23 UR10, UR23
putchar_newline:
    mov UR10, 63
    rem UR23 UR10, UR15
    sub UR10 UR15, UR10
    add UR23 UR10, UR23
    mov UR10, <loop>
    jmp UR10

halt:
    nop
    call UR0, <halt>

