opt subtitle "Microchip Technology Omniscient Code Generator (Lite mode) build 201502162209"

opt pagewidth 120

	opt lm

	processor	18F4550
porta	equ	0F80h
portb	equ	0F81h
portc	equ	0F82h
portd	equ	0F83h
porte	equ	0F84h
lata	equ	0F89h
latb	equ	0F8Ah
latc	equ	0F8Bh
latd	equ	0F8Ch
late	equ	0F8Dh
trisa	equ	0F92h
trisb	equ	0F93h
trisc	equ	0F94h
trisd	equ	0F95h
trise	equ	0F96h
pie1	equ	0F9Dh
pir1	equ	0F9Eh
ipr1	equ	0F9Fh
pie2	equ	0FA0h
pir2	equ	0FA1h
ipr2	equ	0FA2h
t3con	equ	0FB1h
tmr3l	equ	0FB2h
tmr3h	equ	0FB3h
ccp1con	equ	0FBDh
ccpr1l	equ	0FBEh
ccpr1h	equ	0FBFh
adcon1	equ	0FC1h
adcon0	equ	0FC2h
adresl	equ	0FC3h
adresh	equ	0FC4h
sspcon2	equ	0FC5h
sspcon1	equ	0FC6h
sspstat	equ	0FC7h
sspadd	equ	0FC8h
sspbuf	equ	0FC9h
t2con	equ	0FCAh
pr2	equ	0FCBh
tmr2	equ	0FCCh
t1con	equ	0FCDh
tmr1l	equ	0FCEh
tmr1h	equ	0FCFh
rcon	equ	0FD0h
wdtcon	equ	0FD1h
lvdcon	equ	0FD2h
osccon	equ	0FD3h
t0con	equ	0FD5h
tmr0l	equ	0FD6h
tmr0h	equ	0FD7h
status	equ	0FD8h
fsr2	equ	0FD9h
fsr2l	equ	0FD9h
fsr2h	equ	0FDAh
plusw2	equ	0FDBh
preinc2	equ	0FDCh
postdec2	equ	0FDDh
postinc2	equ	0FDEh
indf2	equ	0FDFh
bsr	equ	0FE0h
fsr1	equ	0FE1h
fsr1l	equ	0FE1h
fsr1h	equ	0FE2h
plusw1	equ	0FE3h
preinc1	equ	0FE4h
postdec1	equ	0FE5h
postinc1	equ	0FE6h
indf1	equ	0FE7h
wreg	equ	0FE8h
fsr0	equ	0FE9h
fsr0l	equ	0FE9h
fsr0h	equ	0FEAh
plusw0	equ	0FEBh
preinc0	equ	0FECh
postdec0	equ	0FEDh
postinc0	equ	0FEEh
indf0	equ	0FEFh
intcon3	equ	0FF0h
intcon2	equ	0FF1h
intcon	equ	0FF2h
prod	equ	0FF3h
prodl	equ	0FF3h
prodh	equ	0FF4h
tablat	equ	0FF5h
tblptr	equ	0FF6h
tblptrl	equ	0FF6h
tblptrh	equ	0FF7h
tblptru	equ	0FF8h
pcl	equ	0FF9h
pclat	equ	0FFAh
pclath	equ	0FFAh
pclatu	equ	0FFBh
stkptr	equ	0FFCh
tosl	equ	0FFDh
tosh	equ	0FFEh
tosu	equ	0FFFh
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
	FNCALL	_main,_printf
	FNCALL	_printf,___lwdiv
	FNCALL	_printf,___lwmod
	FNCALL	_printf,_putch
	FNROOT	_main
	global	_dpowers
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	354
_dpowers:
	dw	(01h)&0ffffh
	dw	(0Ah)&0ffffh
	dw	(064h)&0ffffh
	dw	(03E8h)&0ffffh
	dw	(02710h)&0ffffh
	global __end_of_dpowers
__end_of_dpowers:
	global	_dpowers
	
STR_1:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	109	;'m'
	db	65	;'A'
	db	95	;'_'
	db	116	;'t'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_2:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	109	;'m'
	db	66	;'B'
	db	95	;'_'
	db	116	;'t'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_21:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	65	;'A'
	db	38
	db	66	;'B'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_24:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	65	;'A'
	db	42
	db	66	;'B'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_23:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	65	;'A'
	db	43
	db	66	;'B'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_22:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	65	;'A'
	db	124
	db	66	;'B'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_11:
	db	65	;'A'
	db	32
	db	60	;'<'
	db	61	;'='
	db	32
	db	66	;'B'
	db	32
	db	32
	db	32
	db	32
	db	32
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	10
	db	0
	
STR_5:
	db	65	;'A'
	db	32
	db	61	;'='
	db	61	;'='
	db	32
	db	66	;'B'
	db	32
	db	32
	db	32
	db	32
	db	32
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	10
	db	0
	
STR_8:
	db	65	;'A'
	db	32
	db	62	;'>'
	db	61	;'='
	db	32
	db	66	;'B'
	db	32
	db	32
	db	32
	db	32
	db	32
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	10
	db	0
	
STR_14:
	db	65	;'A'
	db	32
	db	61	;'='
	db	61	;'='
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	49	;'1'
	db	32
	db	32
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	10
	db	0
	
STR_17:
	db	65	;'A'
	db	32
	db	61	;'='
	db	61	;'='
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	50	;'2'
	db	32
	db	32
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	10
	db	0
	
STR_20:
	db	115	;'s'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	111	;'o'
	db	102	;'f'
	db	40
	db	65	;'A'
	db	41
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_4:
	db	66	;'B'
	db	32
	db	61	;'='
	db	32
	db	116	;'t'
	db	104	;'h'
	db	105	;'i'
	db	114	;'r'
	db	100	;'d'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_3:
	db	65	;'A'
	db	32
	db	61	;'='
	db	32
	db	102	;'f'
	db	105	;'i'
	db	114	;'r'
	db	115	;'s'
	db	116	;'t'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	10
	db	0
	
STR_25:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_7:
	db	70	;'F'
	db	97	;'a'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_6:
	db	84	;'T'
	db	114	;'r'
	db	117	;'u'
	db	101	;'e'
	db	0
STR_9	equ	STR_6+0
STR_12	equ	STR_6+0
STR_15	equ	STR_6+0
STR_18	equ	STR_6+0
STR_10	equ	STR_7+0
STR_13	equ	STR_7+0
STR_16	equ	STR_7+0
STR_19	equ	STR_7+0
; #config settings
	file	"c_enum.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_putch:	; 0 bytes @ 0x0
??_putch:	; 0 bytes @ 0x0
?_main:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
putch@c:	; 1 bytes @ 0x0
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x0
	ds   2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	ds   2
??___lwdiv:	; 0 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	ds   2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	ds   1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x7
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x7
	ds   2
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x9
	ds   2
??___lwmod:	; 0 bytes @ 0xB
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xB
	ds   1
	global	?_printf
?_printf:	; 2 bytes @ 0xC
	global	printf@f
printf@f:	; 2 bytes @ 0xC
	ds   4
??_printf:	; 0 bytes @ 0x10
	ds   1
	global	printf@flag
printf@flag:	; 1 bytes @ 0x11
	ds   1
	global	printf@prec
printf@prec:	; 1 bytes @ 0x12
	ds   1
	global	printf@ap
printf@ap:	; 2 bytes @ 0x13
	ds   2
	global	printf@cp
printf@cp:	; 2 bytes @ 0x15
	ds   2
	global	printf@val
printf@val:	; 2 bytes @ 0x17
	ds   2
	global	printf@c
printf@c:	; 1 bytes @ 0x19
	ds   1
??_main:	; 0 bytes @ 0x1A
	global	_main$43
_main$43:	; 2 bytes @ 0x1A
	ds   2
	global	_main$48
_main$48:	; 2 bytes @ 0x1C
	ds   2
	global	_main$53
_main$53:	; 2 bytes @ 0x1E
	ds   2
	global	_main$58
_main$58:	; 2 bytes @ 0x20
	ds   2
	global	_main$63
_main$63:	; 2 bytes @ 0x22
	ds   2
	global	main@B
main@B:	; 1 bytes @ 0x24
	ds   1
	global	main@A
main@A:	; 1 bytes @ 0x25
	ds   1
;!
;!Data Sizes:
;!    Strings     267
;!    Constant    10
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95     38      38
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0

;!
;!Pointer List with Targets:
;!
;!    printf@f	PTR const unsigned char  size(2) Largest target is 22
;!		 -> STR_24(CODE[18]), STR_23(CODE[18]), STR_22(CODE[18]), STR_21(CODE[18]), 
;!		 -> STR_20(CODE[16]), STR_17(CODE[17]), STR_14(CODE[17]), STR_11(CODE[17]), 
;!		 -> STR_8(CODE[17]), STR_5(CODE[17]), STR_4(CODE[16]), STR_3(CODE[16]), 
;!		 -> STR_2(CODE[22]), STR_1(CODE[22]), 
;!
;!    printf@cp	PTR const unsigned char  size(2) Largest target is 7
;!		 -> STR_25(CODE[7]), STR_19(CODE[6]), STR_18(CODE[5]), STR_16(CODE[6]), 
;!		 -> STR_15(CODE[5]), STR_13(CODE[6]), STR_12(CODE[5]), STR_10(CODE[6]), 
;!		 -> STR_9(CODE[5]), STR_7(CODE[6]), STR_6(CODE[5]), 
;!
;!    printf@ap	PTR void [1] size(2) Largest target is 2
;!		 -> ?_printf(COMRAM[2]), 
;!
;!    main$63	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_19(CODE[6]), STR_18(CODE[5]), 
;!
;!    main$58	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_16(CODE[6]), STR_15(CODE[5]), 
;!
;!    main$53	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_13(CODE[6]), STR_12(CODE[5]), 
;!
;!    main$48	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_10(CODE[6]), STR_9(CODE[5]), 
;!
;!    main$43	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_7(CODE[6]), STR_6(CODE[5]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_printf
;!    _printf->___lwmod
;!    ___lwmod->___lwdiv
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                12    12      0    2277
;!                                             26 COMRAM    12    12      0
;!                             _printf
;! ---------------------------------------------------------------------------------
;! (1) _printf                                              20    16      4    1753
;!                                             12 COMRAM    14    10      4
;!                            ___lwdiv
;!                            ___lwmod
;!                              _putch
;! ---------------------------------------------------------------------------------
;! (2) _putch                                                1     1      0       0
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4     265
;!                                              7 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     268
;!                                              0 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _printf
;!     ___lwdiv
;!     ___lwmod
;!       ___lwdiv (ARG)
;!     _putch
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMRAM           5F      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMRAM              5F     26      26       1       40.0%
;!STACK                0      0       0       2        0.0%
;!DATA                 0      0       0       3        0.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      0       0       5        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!ABS                  0      0       0      20        0.0%
;!BIGRAM             7FF      0       0      21        0.0%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "D:\git\enum_test\mplab\xc8\c_enum_test.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  A               1   37[COMRAM] enum E185
;;  B               1   36[COMRAM] enum E189
;; Return value:  Size  Location     Type
;;                  2    4[None  ] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:        12       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_printf
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2
	file	"D:\git\enum_test\mplab\xc8\c_enum_test.c"
	line	16
global __ptext0
__ptext0:
psect	text0
	file	"D:\git\enum_test\mplab\xc8\c_enum_test.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 29
	line	21
	
l927:
;c_enum_test.c: 18: enumA_t A;
;c_enum_test.c: 19: enumB_t B;
;c_enum_test.c: 21: printf("sizeof(enumA_t) = %d\n", (int)sizeof(enumA_t));
		movlw	low(STR_1)
	movwf	((c:printf@f)),c
	movlw	high(STR_1)
	movwf	((c:printf@f+1)),c

	movlw	high(01h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(01h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	22
;c_enum_test.c: 22: printf("sizeof(enumB_t) = %d\n", (int)sizeof(enumB_t));
		movlw	low(STR_2)
	movwf	((c:printf@f)),c
	movlw	high(STR_2)
	movwf	((c:printf@f+1)),c

	movlw	high(01h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(01h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	24
	
l929:
;c_enum_test.c: 24: A = first;
	movlw	low(01h)
	movwf	((c:main@A)),c
	line	25
	
l931:
;c_enum_test.c: 25: B = third;
	movlw	low(03h)
	movwf	((c:main@B)),c
	line	26
;c_enum_test.c: 26: printf("A = first = %d\n", (int)A);
		movlw	low(STR_3)
	movwf	((c:printf@f)),c
	movlw	high(STR_3)
	movwf	((c:printf@f+1)),c

	movff	(c:main@A),0+((c:?_printf)+02h)
	clrf	(1+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	27
;c_enum_test.c: 27: printf("B = third = %d\n", (int)B);
		movlw	low(STR_4)
	movwf	((c:printf@f)),c
	movlw	high(STR_4)
	movwf	((c:printf@f+1)),c

	movff	(c:main@B),0+((c:?_printf)+02h)
	clrf	(1+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	28
	
l933:
;c_enum_test.c: 28: printf("A == B     : %s\n", (A==B) ? "True" : "False");
	movf	((c:main@B)),c,w
xorwf	((c:main@A)),c,w
	btfsc	status,2
	goto	u381
	goto	u380

u381:
	goto	l937
u380:
	
l935:
		movlw	low(STR_7)
	movwf	((c:_main$43)),c
	movlw	high(STR_7)
	movwf	((c:_main$43+1)),c

	goto	l939
	
l6:
	
l937:
		movlw	low(STR_6)
	movwf	((c:_main$43)),c
	movlw	high(STR_6)
	movwf	((c:_main$43+1)),c

	goto	l939
	
l8:
	
l939:
		movlw	low(STR_5)
	movwf	((c:printf@f)),c
	movlw	high(STR_5)
	movwf	((c:printf@f+1)),c

		movff	(c:_main$43),0+((c:?_printf)+02h)
	movff	(c:_main$43+1),1+((c:?_printf)+02h)

	call	_printf	;wreg free
	line	29
	
l941:
;c_enum_test.c: 29: printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
		movf	((c:main@B)),c,w
	subwf	((c:main@A)),c,w
	btfsc	status,0
	goto	u391
	goto	u390

u391:
	goto	l945
u390:
	
l943:
		movlw	low(STR_10)
	movwf	((c:_main$48)),c
	movlw	high(STR_10)
	movwf	((c:_main$48+1)),c

	goto	l947
	
l10:
	
l945:
		movlw	low(STR_9)
	movwf	((c:_main$48)),c
	movlw	high(STR_9)
	movwf	((c:_main$48+1)),c

	goto	l947
	
l12:
	
l947:
		movlw	low(STR_8)
	movwf	((c:printf@f)),c
	movlw	high(STR_8)
	movwf	((c:printf@f+1)),c

		movff	(c:_main$48),0+((c:?_printf)+02h)
	movff	(c:_main$48+1),1+((c:?_printf)+02h)

	call	_printf	;wreg free
	line	30
	
l949:
;c_enum_test.c: 30: printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
		movf	((c:main@A)),c,w
	subwf	((c:main@B)),c,w
	btfsc	status,0
	goto	u401
	goto	u400

u401:
	goto	l953
u400:
	
l951:
		movlw	low(STR_13)
	movwf	((c:_main$53)),c
	movlw	high(STR_13)
	movwf	((c:_main$53+1)),c

	goto	l955
	
l14:
	
l953:
		movlw	low(STR_12)
	movwf	((c:_main$53)),c
	movlw	high(STR_12)
	movwf	((c:_main$53+1)),c

	goto	l955
	
l16:
	
l955:
		movlw	low(STR_11)
	movwf	((c:printf@f)),c
	movlw	high(STR_11)
	movwf	((c:printf@f+1)),c

		movff	(c:_main$53),0+((c:?_printf)+02h)
	movff	(c:_main$53+1),1+((c:?_printf)+02h)

	call	_printf	;wreg free
	line	31
	
l957:
;c_enum_test.c: 31: printf("A == 0x01  : %s\n", (A==0x01) ? "True" : "False");
		decf	((c:main@A)),c,w
	btfsc	status,2
	goto	u411
	goto	u410

u411:
	goto	l961
u410:
	
l959:
		movlw	low(STR_16)
	movwf	((c:_main$58)),c
	movlw	high(STR_16)
	movwf	((c:_main$58+1)),c

	goto	l963
	
l18:
	
l961:
		movlw	low(STR_15)
	movwf	((c:_main$58)),c
	movlw	high(STR_15)
	movwf	((c:_main$58+1)),c

	goto	l963
	
l20:
	
l963:
		movlw	low(STR_14)
	movwf	((c:printf@f)),c
	movlw	high(STR_14)
	movwf	((c:printf@f+1)),c

		movff	(c:_main$58),0+((c:?_printf)+02h)
	movff	(c:_main$58+1),1+((c:?_printf)+02h)

	call	_printf	;wreg free
	line	32
	
l965:
;c_enum_test.c: 32: printf("A == 0x02  : %s\n", (A==0x02) ? "True" : "False");
		movlw	2
	xorwf	((c:main@A)),c,w
	btfsc	status,2
	goto	u421
	goto	u420

u421:
	goto	l969
u420:
	
l967:
		movlw	low(STR_19)
	movwf	((c:_main$63)),c
	movlw	high(STR_19)
	movwf	((c:_main$63+1)),c

	goto	l971
	
l22:
	
l969:
		movlw	low(STR_18)
	movwf	((c:_main$63)),c
	movlw	high(STR_18)
	movwf	((c:_main$63+1)),c

	goto	l971
	
l24:
	
l971:
		movlw	low(STR_17)
	movwf	((c:printf@f)),c
	movlw	high(STR_17)
	movwf	((c:printf@f+1)),c

		movff	(c:_main$63),0+((c:?_printf)+02h)
	movff	(c:_main$63+1),1+((c:?_printf)+02h)

	call	_printf	;wreg free
	line	33
	
l973:
;c_enum_test.c: 33: A = 0x01;
	movlw	low(01h)
	movwf	((c:main@A)),c
	line	34
	
l975:
;c_enum_test.c: 34: A = 0x88;
	movlw	low(088h)
	movwf	((c:main@A)),c
	line	35
	
l977:
;c_enum_test.c: 35: A = A&B;
	movf	((c:main@A)),c,w
	andwf	((c:main@B)),c,w
	movwf	((c:main@A)),c
	line	36
	
l979:
;c_enum_test.c: 36: A = A|B;
	movf	((c:main@A)),c,w
	iorwf	((c:main@B)),c,w
	movwf	((c:main@A)),c
	line	37
	
l981:
;c_enum_test.c: 37: A = A+B;
	movf	((c:main@A)),c,w
	addwf	((c:main@B)),c,w
	movwf	((c:main@A)),c
	line	38
	
l983:
;c_enum_test.c: 38: A = A*B;
	movf	((c:main@A)),c,w
	mulwf	((c:main@B)),c
	movff	prodl,(c:main@A)
	line	39
	
l985:
;c_enum_test.c: 39: printf("sizeof(A) = %d\n", (int)sizeof(A));
		movlw	low(STR_20)
	movwf	((c:printf@f)),c
	movlw	high(STR_20)
	movwf	((c:printf@f+1)),c

	movlw	high(01h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(01h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	40
	
l987:
;c_enum_test.c: 40: printf("sizeof(A&B) = %d\n", (int)sizeof(A&B));
		movlw	low(STR_21)
	movwf	((c:printf@f)),c
	movlw	high(STR_21)
	movwf	((c:printf@f+1)),c

	movlw	high(02h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(02h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	41
	
l989:
;c_enum_test.c: 41: printf("sizeof(A|B) = %d\n", (int)sizeof(A|B));
		movlw	low(STR_22)
	movwf	((c:printf@f)),c
	movlw	high(STR_22)
	movwf	((c:printf@f+1)),c

	movlw	high(02h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(02h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	42
	
l991:
;c_enum_test.c: 42: printf("sizeof(A+B) = %d\n", (int)sizeof(A+B));
		movlw	low(STR_23)
	movwf	((c:printf@f)),c
	movlw	high(STR_23)
	movwf	((c:printf@f+1)),c

	movlw	high(02h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(02h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	line	43
	
l993:
;c_enum_test.c: 43: printf("sizeof(A*B) = %d\n", (int)sizeof(A*B));
		movlw	low(STR_24)
	movwf	((c:printf@f)),c
	movlw	high(STR_24)
	movwf	((c:printf@f+1)),c

	movlw	high(02h)
	movwf	(1+((c:?_printf)+02h)),c
	movlw	low(02h)
	movwf	(0+((c:?_printf)+02h)),c
	call	_printf	;wreg free
	goto	l25
	line	45
	
l995:
	line	46
;c_enum_test.c: 45: return 0;
;	Return value of _main is never used
	
l25:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,90
	global	_printf

;; *************** function _printf *****************
;; Defined at:
;;		line 464 in file "C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               2   12[COMRAM] PTR const unsigned char 
;;		 -> STR_24(18), STR_23(18), STR_22(18), STR_21(18), 
;;		 -> STR_20(16), STR_17(17), STR_14(17), STR_11(17), 
;;		 -> STR_8(17), STR_5(17), STR_4(16), STR_3(16), 
;;		 -> STR_2(22), STR_1(22), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  val             2   23[COMRAM] unsigned int 
;;  cp              2   21[COMRAM] PTR const unsigned char 
;;		 -> STR_25(7), STR_19(6), STR_18(5), STR_16(6), 
;;		 -> STR_15(5), STR_13(6), STR_12(5), STR_10(6), 
;;		 -> STR_9(5), STR_7(6), STR_6(5), 
;;  ap              2   19[COMRAM] PTR void [1]
;;		 -> ?_printf(2), 
;;  len             2    0        unsigned int 
;;  c               1   25[COMRAM] char 
;;  prec            1   18[COMRAM] char 
;;  flag            1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   12[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         9       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:        14       0       0       0       0       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	464
global __ptext1
__ptext1:
psect	text1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	464
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:
;incstack = 0
	opt	stack 29
	line	533
	
l863:
;doprnt.c: 466: va_list ap;
;doprnt.c: 499: signed char c;
;doprnt.c: 506: signed char prec;
;doprnt.c: 508: unsigned char flag;
;doprnt.c: 523: union {
;doprnt.c: 524: unsigned long vd;
;doprnt.c: 525: double integ;
;doprnt.c: 526: } tmpval;
;doprnt.c: 528: unsigned int val;
;doprnt.c: 529: unsigned len;
;doprnt.c: 530: const char * cp;
;doprnt.c: 533: *ap = __va_start();
		movlw	low(?_printf+02h)
	movwf	((c:printf@ap)),c
	movlw	high(?_printf+02h)
	movwf	((c:printf@ap+1)),c

	line	536
;doprnt.c: 536: while(c = *f++) {
	goto	l925
	
l37:
	line	538
	
l865:
;doprnt.c: 538: if(c != '%')
		movlw	37
	xorwf	((c:printf@c)),c,w
	btfsc	status,2
	goto	u281
	goto	u280

u281:
	goto	l869
u280:
	line	541
	
l867:
;doprnt.c: 540: {
;doprnt.c: 541: (putch(c) );
	movf	((c:printf@c)),c,w
	
	call	_putch
	line	542
;doprnt.c: 542: continue;
	goto	l925
	line	543
	
l38:
	line	548
	
l869:
;doprnt.c: 543: }
;doprnt.c: 548: flag = 0;
	movlw	low(0)
	movwf	((c:printf@flag)),c
	line	635
;doprnt.c: 635: switch(c = *f++) {
	goto	l887
	line	637
;doprnt.c: 637: case 0:
	
l40:
	line	638
;doprnt.c: 638: goto alldone;
	goto	l60
	line	697
;doprnt.c: 697: case 'd':
	
l42:
	goto	l889
	line	698
	
l43:
	line	699
;doprnt.c: 698: case 'i':
;doprnt.c: 699: break;
	goto	l889
	line	728
;doprnt.c: 728: case 's':
	
l45:
	line	734
	
l871:
;doprnt.c: 734: cp = (*(const char * *)__va_arg((*(const char * **)ap), (const char *)0));
	movff	(c:printf@ap),fsr2l
	movff	(c:printf@ap+1),fsr2h
	movff	postinc2,(c:printf@cp)
	movff	postdec2,(c:printf@cp+1)
	
l873:
	movlw	02h
	addwf	((c:printf@ap)),c
	movlw	0
	addwfc	((c:printf@ap+1)),c
	line	740
	
l875:
;doprnt.c: 740: if(!cp)
	movf	((c:printf@cp)),c,w
iorwf	((c:printf@cp+1)),c,w
	btfss	status,2
	goto	u291
	goto	u290

u291:
	goto	l883
u290:
	line	741
	
l877:
;doprnt.c: 741: cp = "(null)";
		movlw	low(STR_25)
	movwf	((c:printf@cp)),c
	movlw	high(STR_25)
	movwf	((c:printf@cp+1)),c

	goto	l883
	
l46:
	line	777
;doprnt.c: 777: while(*cp)
	goto	l883
	
l48:
	line	778
	
l879:
;doprnt.c: 778: (putch(*cp++) );
	movff	(c:printf@cp),tblptrl
	movff	(c:printf@cp+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	
	call	_putch
	
l881:
	infsnz	((c:printf@cp)),c
	incf	((c:printf@cp+1)),c
	goto	l883
	
l47:
	line	777
	
l883:
	movff	(c:printf@cp),tblptrl
	movff	(c:printf@cp+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	iorlw	0
	btfss	status,2
	goto	u301
	goto	u300
u301:
	goto	l879
u300:
	goto	l925
	
l49:
	line	779
;doprnt.c: 779: continue;
	goto	l925
	line	802
;doprnt.c: 802: default:
	
l50:
	line	813
;doprnt.c: 813: continue;
	goto	l925
	line	822
	
l885:
;doprnt.c: 822: }
	goto	l889
	line	635
	
l39:
	
l887:
	movff	(c:printf@f),tblptrl
	movff	(c:printf@f+1),tblptrh
	infsnz	((c:printf@f)),c
	incf	((c:printf@f+1)),c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:printf@c)
	movf	((c:printf@c)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 115
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l60
	xorlw	100^0	; case 100
	skipnz
	goto	l889
	xorlw	105^100	; case 105
	skipnz
	goto	l889
	xorlw	115^105	; case 115
	skipnz
	goto	l871
	goto	l925

	line	822
	
l44:
	line	1259
	
l889:
;doprnt.c: 1253: {
;doprnt.c: 1259: val = (int)(*(int *)__va_arg((*(int **)ap), (int)0));
	movff	(c:printf@ap),fsr2l
	movff	(c:printf@ap+1),fsr2h
	movff	postinc2,(c:printf@val)
	movff	postdec2,(c:printf@val+1)
	
l891:
	movlw	02h
	addwf	((c:printf@ap)),c
	movlw	0
	addwfc	((c:printf@ap+1)),c
	line	1261
	
l893:
;doprnt.c: 1261: if((int)val < 0) {
	btfsc	((c:printf@val+1)),c,7
	goto	u310
	goto	u311

u311:
	goto	l899
u310:
	line	1262
	
l895:
;doprnt.c: 1262: flag |= 0x03;
	movlw	(03h)&0ffh
	iorwf	((c:printf@flag)),c
	line	1263
	
l897:
;doprnt.c: 1263: val = -val;
	negf	((c:printf@val)),c
	comf	((c:printf@val+1)),c
	btfsc	status,0
	incf	((c:printf@val+1)),c
	goto	l899
	line	1264
	
l51:
	line	1305
	
l899:
;doprnt.c: 1264: }
;doprnt.c: 1266: }
;doprnt.c: 1305: for(c = 1 ; c != sizeof dpowers/sizeof dpowers[0] ; c++)
	movlw	low(01h)
	movwf	((c:printf@c)),c
	
l901:
		movlw	5
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u321
	goto	u320

u321:
	goto	l905
u320:
	goto	l913
	
l903:
	goto	l913
	line	1306
	
l52:
	
l905:
;doprnt.c: 1306: if(val < dpowers[c])
	movf	((c:printf@c)),c,w
	mullw	02h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((c:printf@val)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+1)),c,w
	btfsc	status,0
	goto	u331
	goto	u330

u331:
	goto	l909
u330:
	goto	l913
	line	1307
	
l907:
;doprnt.c: 1307: break;
	goto	l913
	
l54:
	line	1305
	
l909:
	incf	((c:printf@c)),c
	
l911:
		movlw	5
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u341
	goto	u340

u341:
	goto	l905
u340:
	goto	l913
	
l53:
	line	1438
	
l913:
;doprnt.c: 1422: {
;doprnt.c: 1438: if(flag & 0x03)
	movff	(c:printf@flag),??_printf+0+0
	movlw	03h
	andwf	(??_printf+0+0),c
	btfsc	status,2
	goto	u351
	goto	u350
u351:
	goto	l917
u350:
	line	1439
	
l915:
;doprnt.c: 1439: (putch('-') );
	movlw	(02Dh)&0ffh
	
	call	_putch
	goto	l917
	
l55:
	line	1472
	
l917:
;doprnt.c: 1469: }
;doprnt.c: 1472: prec = c;
	movff	(c:printf@c),(c:printf@prec)
	line	1474
;doprnt.c: 1474: while(prec--) {
	goto	l923
	
l57:
	line	1489
	
l919:
;doprnt.c: 1478: {
;doprnt.c: 1489: c = (val / dpowers[prec]) % 10 + '0';
	movf	((c:printf@prec)),c,w
	mullw	02h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___lwdiv@divisor)
	tblrd*-
	
	movff	tablat,(c:___lwdiv@divisor+1)

	movff	(c:printf@val),(c:___lwdiv@dividend)
	movff	(c:printf@val+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor)),c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod),c,w
	addlw	low(030h)
	movwf	((c:printf@c)),c
	line	1524
	
l921:
;doprnt.c: 1523: }
;doprnt.c: 1524: (putch(c) );
	movf	((c:printf@c)),c,w
	
	call	_putch
	goto	l923
	line	1525
	
l56:
	line	1474
	
l923:
	decf	((c:printf@prec)),c
		incf	((c:printf@prec)),c,w
	btfss	status,2
	goto	u361
	goto	u360

u361:
	goto	l919
u360:
	goto	l925
	
l58:
	goto	l925
	line	1533
	
l36:
	line	536
	
l925:
	movff	(c:printf@f),tblptrl
	movff	(c:printf@f+1),tblptrh
	infsnz	((c:printf@f)),c
	incf	((c:printf@f+1)),c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:printf@c)
	movf	((c:printf@c)),c,w
	btfss	status,2
	goto	u371
	goto	u370
u371:
	goto	l865
u370:
	goto	l60
	
l59:
	goto	l60
	line	1535
;doprnt.c: 1525: }
;doprnt.c: 1533: }
;doprnt.c: 1535: alldone:
	
l41:
	line	1541
;doprnt.c: 1540: return 0;
;	Return value of _printf is never used
	
l60:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
	signat	_printf,602
	global	_putch

;; *************** function _putch *****************
;; Defined at:
;;		line 7 in file "C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\putch.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\putch.c"
	line	7
global __ptext2
__ptext2:
psect	text2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\putch.c"
	line	7
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:
;incstack = 0
	opt	stack 29
	line	9
	
l611:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
	signat	_putch,4216
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    7[COMRAM] unsigned int 
;;  divisor         2    9[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwmod.c"
	line	8
global __ptext3
__ptext3:
psect	text3
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwmod.c"
	line	8
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:
;incstack = 0
	opt	stack 29
	line	13
	
l847:
	movf	((c:___lwmod@divisor)),c,w
iorwf	((c:___lwmod@divisor+1)),c,w
	btfsc	status,2
	goto	u251
	goto	u250

u251:
	goto	l591
u250:
	line	14
	
l849:
	movlw	low(01h)
	movwf	((c:___lwmod@counter)),c
	line	15
	goto	l853
	
l593:
	line	16
	
l851:
	bcf	status,0
	rlcf	((c:___lwmod@divisor)),c
	rlcf	((c:___lwmod@divisor+1)),c
	line	17
	incf	((c:___lwmod@counter)),c
	goto	l853
	line	18
	
l592:
	line	15
	
l853:
	
	btfss	((c:___lwmod@divisor+1)),c,(15)&7
	goto	u261
	goto	u260
u261:
	goto	l851
u260:
	goto	l855
	
l594:
	goto	l855
	line	19
	
l595:
	line	20
	
l855:
		movf	((c:___lwmod@divisor)),c,w
	subwf	((c:___lwmod@dividend)),c,w
	movf	((c:___lwmod@divisor+1)),c,w
	subwfb	((c:___lwmod@dividend+1)),c,w
	btfss	status,0
	goto	u271
	goto	u270

u271:
	goto	l859
u270:
	line	21
	
l857:
	movf	((c:___lwmod@divisor)),c,w
	subwf	((c:___lwmod@dividend)),c
	movf	((c:___lwmod@divisor+1)),c,w
	subwfb	((c:___lwmod@dividend+1)),c

	goto	l859
	
l596:
	line	22
	
l859:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1)),c
	rrcf	((c:___lwmod@divisor)),c
	line	23
	
l861:
	decfsz	((c:___lwmod@counter)),c
	
	goto	l855
	goto	l591
	
l597:
	line	24
	
l591:
	line	25
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	26
	
l598:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    0[COMRAM] unsigned int 
;;  divisor         2    2[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    4[COMRAM] unsigned int 
;;  counter         1    6[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwdiv.c"
	line	8
global __ptext4
__ptext4:
psect	text4
	file	"C:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lwdiv.c"
	line	8
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:
;incstack = 0
	opt	stack 29
	line	14
	
l825:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1)),c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient)),c
	line	15
	
l827:
	movf	((c:___lwdiv@divisor)),c,w
iorwf	((c:___lwdiv@divisor+1)),c,w
	btfsc	status,2
	goto	u221
	goto	u220

u221:
	goto	l581
u220:
	line	16
	
l829:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter)),c
	line	17
	goto	l833
	
l583:
	line	18
	
l831:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor)),c
	rlcf	((c:___lwdiv@divisor+1)),c
	line	19
	incf	((c:___lwdiv@counter)),c
	goto	l833
	line	20
	
l582:
	line	17
	
l833:
	
	btfss	((c:___lwdiv@divisor+1)),c,(15)&7
	goto	u231
	goto	u230
u231:
	goto	l831
u230:
	goto	l835
	
l584:
	goto	l835
	line	21
	
l585:
	line	22
	
l835:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient)),c
	rlcf	((c:___lwdiv@quotient+1)),c
	line	23
	
l837:
		movf	((c:___lwdiv@divisor)),c,w
	subwf	((c:___lwdiv@dividend)),c,w
	movf	((c:___lwdiv@divisor+1)),c,w
	subwfb	((c:___lwdiv@dividend+1)),c,w
	btfss	status,0
	goto	u241
	goto	u240

u241:
	goto	l843
u240:
	line	24
	
l839:
	movf	((c:___lwdiv@divisor)),c,w
	subwf	((c:___lwdiv@dividend)),c
	movf	((c:___lwdiv@divisor+1)),c,w
	subwfb	((c:___lwdiv@dividend+1)),c

	line	25
	
l841:
	bsf	(0+(0/8)+(c:___lwdiv@quotient)),c,(0)&7
	goto	l843
	line	26
	
l586:
	line	27
	
l843:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1)),c
	rrcf	((c:___lwdiv@divisor)),c
	line	28
	
l845:
	decfsz	((c:___lwdiv@counter)),c
	
	goto	l835
	goto	l581
	
l587:
	line	29
	
l581:
	line	30
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	31
	
l588:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
psect	mediumconst
	db 0	; dummy byte at the end
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 16
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
