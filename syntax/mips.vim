" Vim syntax file
" Language: MIPS
" Original Author: Alex Brick <alex@alexrbrick.com>
" Maintainer: Harenome Ranaivoarivony Razanajato <harno.ranaivo@gmail.com>
" Last Change: 2013 Apr 22
" Based on Alex Brick's syntax file:
" http://www.vim.org/scripts/script.php?script_id=2045

" Init {{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syntax case match
"}}}

" Basics {{{
syntax match mipsComment /#.*/
syntax match mipsNumber /\<[-]\?\d\+\>/ " Decimal numbers
syntax match mipsNumber /\<-\?0\(x\|X\)[0-9a-fA-F]\+\>/ " Hex numbers
syntax region mipsString start=/"/ skip=/\\"/ end=/"/
syntax match mipsLabelColon /:/ contained
syntax match mipsLabel /\w\+:/ contains=mipsLabelColon
"}}}

" Registers {{{
" O32 Calling Convention {{{
syntax match mipsRegister "\$zero"
syntax match mipsRegister "\$at"
syntax match mipsRegister "\$v0"
syntax match mipsRegister "\$v1"
syntax match mipsRegister "\$a0"
syntax match mipsRegister "\$a1"
syntax match mipsRegister "\$a2"
syntax match mipsRegister "\$a3"
syntax match mipsRegister "\$t0"
syntax match mipsRegister "\$t1"
syntax match mipsRegister "\$t2"
syntax match mipsRegister "\$t3"
syntax match mipsRegister "\$t4"
syntax match mipsRegister "\$t5"
syntax match mipsRegister "\$t6"
syntax match mipsRegister "\$t7"
syntax match mipsRegister "\$s0"
syntax match mipsRegister "\$s1"
syntax match mipsRegister "\$s2"
syntax match mipsRegister "\$s3"
syntax match mipsRegister "\$s4"
syntax match mipsRegister "\$s5"
syntax match mipsRegister "\$s6"
syntax match mipsRegister "\$s7"
syntax match mipsRegister "\$t8"
syntax match mipsRegister "\$t9"
syntax match mipsRegister "\$k0"
syntax match mipsRegister "\$k1"
syntax match mipsRegister "\$gp"
syntax match mipsRegister "\$sp"
syntax match mipsRegister "\$fp"
syntax match mipsRegister "\$ra"
"}}}

" N32 and N64 Calling Convention {{{
syntax match mipsRegister "\$a4"
syntax match mipsRegister "\$a5"
syntax match mipsRegister "\$a6"
syntax match mipsRegister "\$a7"
syntax match mipsRegister "\$s8"
"}}}
let i = 0
while i < 32
    " This is for the regular registers
    execute 'syntax match mipsRegister "\$' . i . '\(\d\+\)\@!"'
    " And this is for the FP registers
    execute 'syntax match mipsRegister "\$f' . i . '\(\d\+\)\@!"'
    let i = i + 1
endwhile
"}}}

" Directives {{{
syntax match mipsDirective "\.2byte"
syntax match mipsDirective "\.4byte"
syntax match mipsDirective "\.8byte"
syntax match mipsDirective "\.aent"
syntax match mipsDirective "\.align"
syntax match mipsDirective "\.aascii"
syntax match mipsDirective "\.asciiz"
syntax match mipsDirective "\.byte"
syntax match mipsDirective "\.comm"
syntax match mipsDirective "\.cpadd"
syntax match mipsDirective "\.cpload"
syntax match mipsDirective "\.cplocal"
syntax match mipsDirective "\.cprestore"
syntax match mipsDirective "\.cpreturn"
syntax match mipsDirective "\.cpsetup"
syntax match mipsDirective "\.data"
syntax match mipsDirective "\.double"
syntax match mipsDirective "\.dword"
syntax match mipsDirective "\.dynsym"
syntax match mipsDirective "\.end"
syntax match mipsDirective "\.endr"
syntax match mipsDirective "\.ent"
syntax match mipsDirective "\.extern"
syntax match mipsDirective "\.file"
syntax match mipsDirective "\.float"
syntax match mipsDirective "\.fmask"
syntax match mipsDirective "\.frame"
syntax match mipsDirective "\.globl"
syntax match mipsDirective "\.gpvalue"
syntax match mipsDirective "\.gpword"
syntax match mipsDirective "\.half"
syntax match mipsDirective "\.kdata"
syntax match mipsDirective "\.ktext"
syntax match mipsDirective "\.lab"
syntax match mipsDirective "\.lcomm"
syntax match mipsDirective "\.loc"
syntax match mipsDirective "\.mask"
syntax match mipsDirective "\.nada"
syntax match mipsDirective "\.nop"
syntax match mipsDirective "\.option"
syntax match mipsDirective "\.origin"
syntax match mipsDirective "\.repeat"
syntax match mipsDirective "\.rdata"
syntax match mipsDirective "\.sdata"
syntax match mipsDirective "\.section"
syntax match mipsDirective "\.set"
syntax match mipsDirective "\.size"
syntax match mipsDirective "\.space"
syntax match mipsDirective "\.struct"
syntax match mipsDirective "\.text"
syntax match mipsDirective "\.type"
syntax match mipsDirective "\.verstamp"
syntax match mipsDirective "\.weakext"
syntax match mipsDirective "\.word"
"}}}

" Instruction Sets {{{
" MIPS1 {{{
" Instructions {{{
syntax keyword mipsInstruction add addi addiu addu
syntax keyword mipsInstruction and andi
syntax keyword mipsInstruction bc0f bc0t bc1f bc1t bc2f bc2t bc3f bc3t
syntax keyword mipsInstruction beq beqz
syntax keyword mipsInstruction bgez bgezal bgtz
syntax keyword mipsInstruction blez bltz bltzal
syntax keyword mipsInstruction bne bnez
syntax keyword mipsInstruction break
syntax keyword mipsInstruction c0 c1 c2 c3
syntax keyword mipsInstruction cfc0 cfc1 cfc2 cfc3
syntax keyword mipsInstruction ctc0 ctc1 ctc2 ctc3
syntax keyword mipsInstruction div divu
syntax keyword mipsInstruction j jal jalr jalx jr
syntax keyword mipsInstruction lb lbu lh lhu lui
syntax keyword mipsInstruction lw lwc0 lwc1 lwc2 lwc3 lwl lwr
syntax keyword mipsInstruction mfc0 mfc1 mfc2 mfc3 mfhi mflo
syntax keyword mipsInstruction mtc0 mtc1 mtc2 mtc3 mthi mtlo
syntax keyword mipsInstruction mult multu
syntax keyword mipsInstruction neg negu
syntax keyword mipsInstruction nor not or ori
syntax keyword mipsInstruction rem remu rfe
syntax keyword mipsInstruction sb sh
syntax keyword mipsInstruction sll sllv slt slti sltiu sltu
syntax keyword mipsInstruction sra srav srl srlv
syntax keyword mipsInstruction sub subu
syntax keyword mipsInstruction sw swc0 swc1 swc2 swc3 swl swr
syntax keyword mipsInstruction syscall
syntax keyword mipsInstruction tlbp tlbr tlbwi tlbwr
syntax keyword mipsInstruction xor xori

syntax match mipsInstruction "abs\.d"
syntax match mipsInstruction "abs\.s"
syntax match mipsInstruction "add\.d"
syntax match mipsInstruction "add\.s" 
syntax match mipsInstruction "c\.eq\.d"
syntax match mipsInstruction "c\.eq\.s"
syntax match mipsInstruction "c\.f\.d"
syntax match mipsInstruction "c\.f\.s"
syntax match mipsInstruction "c\.le\.d"
syntax match mipsInstruction "c\.le\.s"
syntax match mipsInstruction "c\.lt\.d"
syntax match mipsInstruction "c\.lt\.s"
syntax match mipsInstruction "c\.nge\.d"
syntax match mipsInstruction "c\.nge\.s"
syntax match mipsInstruction "c\.ngl\.d"
syntax match mipsInstruction "c\.ngle\.d"
syntax match mipsInstruction "c\.ngle\.s"
syntax match mipsInstruction "c\.ngl\.s"
syntax match mipsInstruction "c\.ngt\.d"
syntax match mipsInstruction "c\.ngt\.s"
syntax match mipsInstruction "c\.ole\.d"
syntax match mipsInstruction "c\.ole\.s"
syntax match mipsInstruction "c\.olt\.d"
syntax match mipsInstruction "c\.olt\.s"
syntax match mipsInstruction "c\.seq\.d"
syntax match mipsInstruction "c\.seq\.s"
syntax match mipsInstruction "c\.sf\.d"
syntax match mipsInstruction "c\.sf\.s"
syntax match mipsInstruction "c\.ueq\.d"
syntax match mipsInstruction "c\.ueq\.s"
syntax match mipsInstruction "c\.ule\.d"
syntax match mipsInstruction "c\.ule\.s"
syntax match mipsInstruction "c\.ult\.d"
syntax match mipsInstruction "c\.ult\.s"
syntax match mipsInstruction "c\.un\.d"
syntax match mipsInstruction "c\.un\.s"
syntax match mipsInstruction "cvt\.d\.s"
syntax match mipsInstruction "cvt\.d\.w"
syntax match mipsInstruction "cvt\.s\.d"
syntax match mipsInstruction "cvt\.s\.w"
syntax match mipsInstruction "cvt\.w\.d"
syntax match mipsInstruction "cvt\.w\.s"
syntax match mipsInstruction "div\.d"
syntax match mipsInstruction "div\.s"
syntax match mipsInstruction "l\.s"
syntax match mipsInstruction "mov\.d"
syntax match mipsInstruction "mov\.s"
syntax match mipsInstruction "mul\.d"
syntax match mipsInstruction "mul\.s"
syntax match mipsInstruction "neg\.d"
syntax match mipsInstruction "neg\.s"
syntax match mipsInstruction "s\.s"
syntax match mipsInstruction "sub\.d"
syntax match mipsInstruction "sub\.s"
"}}}

" Alias {{{
syntax keyword mipsAlias b bal
syntax keyword mipsAlias ehb
syntax keyword mipsAlias nop ssnop
"}}}

" Macros {{{
syntax keyword mipsMacro abs
syntax keyword mipsMacro bge bgeu bgt bgtu ble bleu blt Highlights bltu
syntax keyword mipsMacro cop0 cop1 cop2 cop3
syntax keyword mipsMacro la lca ld li
syntax keyword mipsMacro move
syntax keyword mipsMacro mul mulo mulou
syntax keyword mipsMacro rol ror
syntax keyword mipsMacro sd seq sge sgeu sgt sgtu
syntax keyword mipsMacro sle sleu sne
syntax keyword mipsMacro ulh ulhu ulw ush usw

syntax match mipsMacro "l\.d"
syntax match mipsMacro "li\.d"
syntax match mipsMacro "li\.s"
syntax match mipsMacro "s\.d"
syntax match mipsMacro "trunc\.w\.d"
syntax match mipsMacro "trunc\.w\.s"
"}}}
"}}}

" MIPS2 {{{
" Instructions {{{
syntax keyword mipsInstruction bc0fl bc0tl bc1fl bc1tl bc2fl bc2tl bc3fl bc3tl
syntax keyword mipsInstruction beql beqzl
syntax keyword mipsInstruction bgezall bgezl bgtzl
syntax keyword mipsInstruction blezl bltzall bltzl
syntax keyword mipsInstruction bnel bnezl
syntax keyword mipsInstruction flush
syntax keyword mipsInstruction invalidate
syntax keyword mipsInstruction lcache
syntax keyword mipsInstruction ldc1 ldc2 ldc3 ll
syntax keyword mipsInstruction sc scache sdc1 sdc2 sdc3
syntax keyword mipsInstruction sync
syntax keyword mipsInstruction teq teqi
syntax keyword mipsInstruction tge tgei tgeiu tgeu
syntax keyword mipsInstruction tlt tlti tltiu tltu
syntax keyword mipsInstruction tne tnei

syntax match mipsInstruction "ceil\.w\.d"
syntax match mipsInstruction "ceil\.w\.s"
syntax match mipsInstruction "floor\.w\.d"
syntax match mipsInstruction "floor\.w\.s"
syntax match mipsInstruction "round\.w\.d"
syntax match mipsInstruction "round\.w\.s"
syntax match mipsInstruction "sqrt\.d"
syntax match mipsInstruction "sqrt\.s"
syntax match mipsInstruction "sync\.l"
syntax match mipsInstruction "sync\.p"
"}}}

" Macros {{{
syntax keyword mipsMacro bgel bgeul bgtl bgtul
syntax keyword mipsMacro blel bleul bltl bltul
"}}}
"}}}

" MIPS3 {{{
syntax keyword mipsInstruction cache
syntax keyword mipsInstruction clo clz
syntax keyword mipsInstruction dabs dadd daddi daddiu daddu
syntax keyword mipsInstruction dctr dctw
syntax keyword mipsInstruction ddiv ddivu
syntax keyword mipsInstruction deret
syntax keyword mipsInstruction di
syntax keyword mipsInstruction dla dlca dli
syntax keyword mipsInstruction dmfc0 dmfc1 dmfc2 dmfc3
syntax keyword mipsInstruction dmtc0 dmtc1 dmtc2 dmtc3
syntax keyword mipsInstruction dmul dmulo dmulou dmult dmultu
syntax keyword mipsInstruction dneg dnegu
syntax keyword mipsInstruction drem dremu
syntax keyword mipsInstruction drol dror
syntax keyword mipsInstruction dsll dsll32 dsllv
syntax keyword mipsInstruction dsra dsra32 dsrav dsrl dsrl32 dsrlv
syntax keyword mipsInstruction dsub dsubu
syntax keyword mipsInstruction ei
syntax keyword mipsInstruction eret
syntax keyword mipsInstruction ext
syntax keyword mipsInstruction ins
syntax keyword mipsInstruction ldl ldr lld lwu
syntax keyword mipsInstruction madd maddu
syntax keyword mipsInstruction mfhc1 mfhc2
syntax keyword mipsInstruction msub msubu
syntax keyword mipsInstruction mthc1 mthc2
syntax keyword mipsInstruction pause
syntax keyword mipsInstruction rdhwr rdpgpr
syntax keyword mipsInstruction rorv rotl rotr rotrv
syntax keyword mipsInstruction scd
syntax keyword mipsInstruction sdbbp sdl sdr
syntax keyword mipsInstruction seb
syntax keyword mipsInstruction seh
syntax keyword mipsInstruction sync_acquire synci sync_release
syntax keyword mipsInstruction sync_mb sync_rmb sync_wmb
syntax keyword mipsInstruction udi0 udi1 udi2 udi3 udi4 udi5 udi6 udi7 udi8 udi9
syntax keyword mipsInstruction udi10 udi11 udi12 udi13 udi14 udi15
syntax keyword mipsInstruction uld usd
syntax keyword mipsInstruction wait
syntax keyword mipsInstruction wrpgpr
syntax keyword mipsInstruction wsbh

syntax match mipsInstruction "ceil\.l\.d"
syntax match mipsInstruction "ceil\.l\.s"
syntax match mipsInstruction "cvt\.d\.l"
syntax match mipsInstruction "cvt\.l\.d"
syntax match mipsInstruction "cvt\.l\.s"
syntax match mipsInstruction "cvt\.s\.l"
syntax match mipsInstruction "floor\.l\.d"
syntax match mipsInstruction "floor\.l\.s"
syntax match mipsInstruction "jalr\.hb"
syntax match mipsInstruction "jr\.hb"
syntax match mipsInstruction "round\.l\.d"
syntax match mipsInstruction "round\.l\.s"
syntax match mipsInstruction "trunc\.l\.d"
syntax match mipsInstruction "trunc\.l\.s"
"}}}

" MIPS4 32 {{{
syntax keyword mipsInstruction movf movn movt movz
syntax keyword mipsInstruction pref

syntax match mipsInstruction "movf\.d"
syntax match mipsInstruction "movf\.s"
syntax match mipsInstruction "movn\.d"
syntax match mipsInstruction "movn\.s"
syntax match mipsInstruction "movt\.d"
syntax match mipsInstruction "movt\.s"
syntax match mipsInstruction "movz\.d"
syntax match mipsInstruction "movz\.s"
"}}}

" MIPS4 32R2 {{{
syntax keyword mipsInstruction ldxc1
syntax keyword mipsInstruction lwxc1
syntax keyword mipsInstruction prefx
syntax keyword mipsInstruction sdxc1
syntax keyword mipsInstruction swxc1

syntax match mipsInstruction "madd\.d"
syntax match mipsInstruction "madd\.s"
syntax match mipsInstruction "msub\.d"
syntax match mipsInstruction "msub\.s"
syntax match mipsInstruction "nmadd\.d"
syntax match mipsInstruction "nmadd\.s"
syntax match mipsInstruction "nmsub\.d"
syntax match mipsInstruction "nmsub\.s"
syntax match mipsInstruction "recip\.d"
syntax match mipsInstruction "recip\.s"
syntax match mipsInstruction "rsqrt\.d"
syntax match mipsInstruction "rsqrt\.s"
"}}}

" MIPS5 32R2 {{{
syntax keyword mipsInstruction luxc1
syntax keyword mipsInstruction suxc1

syntax match mipsInstruction "abs\.ps"
syntax match mipsInstruction "add\.ps"
syntax match mipsInstruction "alnv\.ps"
syntax match mipsInstruction "c\.eq\.ps"
syntax match mipsInstruction "c\.f\.ps"
syntax match mipsInstruction "c\.le\.ps"
syntax match mipsInstruction "c\.lt\.ps"
syntax match mipsInstruction "c\.nge\.ps"
syntax match mipsInstruction "c\.ngl\.ps"
syntax match mipsInstruction "c\.ngle\.ps"
syntax match mipsInstruction "c\.ngt\.ps"
syntax match mipsInstruction "c\.ole\.ps"
syntax match mipsInstruction "c\.olt\.ps"
syntax match mipsInstruction "c\.seq\.ps"
syntax match mipsInstruction "c\.sf\.ps"
syntax match mipsInstruction "c\.ueq\.ps"
syntax match mipsInstruction "c\.ule\.ps"
syntax match mipsInstruction "c\.ult\.ps"
syntax match mipsInstruction "c\.un\.ps"
syntax match mipsInstruction "cvt\.ps\.s"
syntax match mipsInstruction "cvt\.s\.pl"
syntax match mipsInstruction "cvt\.s\.pu"
syntax match mipsInstruction "madd\.ps"
syntax match mipsInstruction "mov\.ps"
syntax match mipsInstruction "movf\.ps"
syntax match mipsInstruction "movn\.ps"
syntax match mipsInstruction "movt\.ps"
syntax match mipsInstruction "movz\.ps"
syntax match mipsInstruction "msub\.ps"
syntax match mipsInstruction "mul\.ps"
syntax match mipsInstruction "neg\.ps"
syntax match mipsInstruction "nmadd\.ps"
syntax match mipsInstruction "nmsub\.ps"
syntax match mipsInstruction "pll\.ps"
syntax match mipsInstruction "plu\.ps"
syntax match mipsInstruction "pul\.ps"
syntax match mipsInstruction "puu\.ps"
syntax match mipsInstruction "sub\.ps"
"}}}

" MIPS64 {{{
syntax keyword mipsInstruction dclo dclz
"}}}

" MIPS64R2 {{{
" Instructions {{{
syntax keyword mipsInstruction dext dextm dextu
syntax keyword mipsInstruction dins dinsm dinsu
syntax keyword mipsInstruction dror32 drorv drotr32 drotrv
syntax keyword mipsInstruction dsbh dshd
"}}}

" Macros {{{
syntax keyword mipsMacro drotl drotr
"}}}
"}}}
"}}}

" Pseudo things {{{
" Some compilers and emulators support some
" of the following instructions, directives, etc.

" Pseudo Instructions {{{
syntax keyword mipsPseudoInstruction subi subiu
syntax keyword mipsPseudoInstruction blti
syntax keyword mipsPseudoInstruction clear
"}}}

" Pseudo Directives {{{
syntax match mipsPseudoDirective "\.macro"
syntax match mipsPseudoDirective "\.end_macro"
syntax match mipsPseudoDirective "\.include"
syntax match mipsPseudoDirective "\.eqv"
"}}}
"}}}

" Highlights Linking {{{
hi def link mipsComment             Comment
hi def link mipsNumber              Number
hi def link mipsString              String
hi def link mipsLabel               Label
hi def link mipsRegister            Identifier
hi def link mipsDirective           Type
hi def link mipsInstruction         Statement
hi def link mipsAlias               mipsInstruction
hi def link mipsMacro               mipsInstruction
hi def link mipsPseudoInstruction   PreProc
hi def link mipsPseudoDirective     PreProc
"}}}

let b:current_syntax = "mips"
" vim:ft=vim:fdm=marker:ff=unix:foldopen=all:foldclose=all:colorcolumn=80
