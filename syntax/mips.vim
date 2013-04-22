" Vim syntax file
" Language: MIPS
" Maintainer: Harenome Ranaivoarivony
" Razanajato <harno.ranaivo@gmail.com>
" Last Change:  2013 Apr 22
" Based on Alex Brick's <alex@alexrbrick.com> syntax file : http://www.vim.org/scripts/script.php?script_id=2045

" Init {{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syntax case match
"}}}

" Categories {{{
syntax match mipsComment /#.*/
syntax match mipsNumber /\<[-]\?\d\+\>/ " Decimal numbers
syntax match mipsNumber /\<-\?0\(x\|X\)[0-9a-fA-F]\+\>/ " Hex numbers
syntax region mipsString start=/"/ skip=/\\"/ end=/"/
syntax match mipsLabelColon /:/ contained
syntax match mipsLabel /\w\+:/ contains=mipsLabelColon
"}}}

" Registers {{{
syntax match mipsRegister "\$zero"
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
syntax match mipsRegister "\$t8"
syntax match mipsRegister "\$t9"
syntax match mipsRegister "\$s0"
syntax match mipsRegister "\$s1"
syntax match mipsRegister "\$s2"
syntax match mipsRegister "\$s3"
syntax match mipsRegister "\$s4"
syntax match mipsRegister "\$s5"
syntax match mipsRegister "\$s6"
syntax match mipsRegister "\$s7"
syntax match mipsRegister "\$k0"
syntax match mipsRegister "\$k1"
syntax match mipsRegister "\$gp"
syntax match mipsRegister "\$sp"
syntax match mipsRegister "\$fp"
syntax match mipsRegister "\$ra"

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

" Instructions {{{
" CPU Loads and Stores {{{
    " Delayed Loads {{{
        " Normal CPU Load/Store Instructions {{{
            " MIPS I
            syntax keyword mipsInstruction lb lbu lh lhu lw
            syntax keyword mipsInstruction sb sh sw
            " MIPS III
            syntax keyword mipsInstruction lwu ld
            syntax keyword mipsInstruction sd
        "}}}

        " Unaligned CPU Load/Store Instructions {{{
            " MIPS I
            syntax keyword mipsInstruction lwl lwr
            syntax keyword mipsInstruction swl swr
            " MIPS III
            syntax keyword mipsInstruction ldl ldr
            syntax keyword mipsInstruction sdl sdr
        "}}}

        " Atomic Update CPU Load/Store Instructions {{{
            " MIPS II
            syntax keyword mipsInstruction ll
            syntax keyword mipsInstruction sc
            " MIPS III
            syntax keyword mipsInstruction lld
            syntax keyword mipsInstruction scd
        "}}}
    "}}}

    " Coprocessor Loads and Stores {{{
        " Coprocessor Load/Store Instructions {{{
            " MIPS I
            syntax keyword mipsInstruction lwc1
            syntax keyword mipsInstruction swc1
            " MIPS II
            syntax keyword mipsInstruction ldc1
            syntax keyword mipsInstruction sdc1
        "}}}

        " FPU Load/Store Instructions {{{
            " MIPS IV
            syntax keyword mipsInstruction lwxc1 ldxc1
            syntax keyword mipsInstruction swxc1 sdxc1
        "}}}
    "}}}

    " Load and Store Misc. {{{
        " MIPS #?
        syntax keyword mipsInstruction la
        syntax keyword mipsInstruction ulh ulhu ulw
        syntax keyword mipsInstruction ush usw
    "}}}
"}}}

" Computational Instructions {{{
    " Arithmetic and Logical Instructions {{{
        " ALU Instructions with and Immediate Operand {{{
            " MIPS I
            syntax keyword mipsInstruction addi addiu slti sltiu andi ori xori lui
            " MIPS III
            syntax keyword mipsInstruction daddi daddiu
        "}}}

        " 3-Operand ALU Instructions {{{
            " MIPS I
            syntax keyword mipsInstruction add addu sub subu slt sltu and or xor nor
            " MIPS III
            syntax keyword mipsInstruction dadd daddu dsub dsubu
        "}}}

        " ALU Misc. {{{
            " MIPS #?
            syntax keyword mipsInstruction abs
            syntax keyword mipsInstruction clo clz
            syntax keyword mipsInstruction mul mulo mulou madd maddu msub msubu
            syntax keyword mipsInstruction neg negu
            syntax keyword mipsInstruction not
            syntax keyword mipsInstruction rem remu
            syntax keyword mipsInstruction rol ror
        "}}}

    "}}}

    " Shifts {{{
        " MIPS I
        syntax keyword mipsInstruction sll srl sra sllv srlv srav
        " MIPS III
        syntax keyword mipsInstruction dsll dsrl dsra dsll32 dsrl32 dsra32 dsllv dsrlv dsrav
    "}}}

    " Multiply and Divide {{{
        " MIPS I
        syntax keyword mipsInstruction mult multu div divu
        syntax keyword mipsInstruction mfhi mthi mflo mtlo
        " MIPS III
        syntax keyword mipsInstruction dmult dmultu ddiv ddivu
    "}}}
"}}}

" Jump and Branch Instructions {{{
    " Jumping Within a 256 Megabyte Region {{{
        " MIPS I
        syntax keyword mipsInstruction j jal
    "}}}

    " Jumping to Avsolute Address {{{
        " MIPS I
        syntax keyword mipsInstruction jr jalr
    "}}}

    " PC-Relative Conditional Branch Instructions Comparing 2 Registers {{{
        " MIPS I
        syntax keyword mipsInstruction beq bne blez bgtz
        " MIPS II
        syntax keyword mipsInstruction beql bnel blezl bgtzl
    "}}}

    " PC-Relative Conditional Branch Instructions Comparing Against Zero {{{
        " MIPS I
        syntax keyword mipsInstruction bltz bgez bltzal bgezal
        " MIPS II
        syntax keyword mipsInstruction bltzl bgezl bltzall bgezall
    "}}}

    " Branch and Jump Misc. {{{
        " MIPS #?
        syntax keyword mipsInstruction b
        syntax keyword mipsInstruction bc1f bc1t
        syntax keyword mipsInstruction beqz
        syntax keyword mipsInstruction bnez
        syntax keyword mipsInstruction bgeu
        syntax keyword mipsInstruction bgtu
        syntax keyword mipsInstruction bleu
        syntax keyword mipsInstruction blt bltu
    "}}}

"}}}

" Miscellaneous Instructions {{{
    " Exception Instructions {{{
        " System Call and Breakpoint Instructions {{{
            " MIPS I
            syntax keyword mipsInstruction syscall break
        "}}}

        " Trap-on-Condition Instructions Comparing Two Registers {{{
            " MIPS II
            syntax keyword mipsInstruction tge tgeu tlt tltu teq tne
        "}}}

        " Trap-on-Condition Instructions Comparing an Immediate {{{
            " MIPS II
            syntax keyword mipsInstruction tgei tgeiu tlti tltiu teqi tnei
        "}}}

        " Exception and Interrupt Instructions {{{
            " MIPS #?
            syntax keyword mipsInstruction eret
            syntax keyword mipsInstruction nop
        "}}}

    "}}}

    " Serialization Instructions {{{
        " MIPS II
        syntax keyword mipsInstruction sync
    "}}}

    " Conditionnal Move Instructions {{{
        " MIPS IV
        syntax keyword mipsInstruction movn movz
    "}}}

    " Prefetch {{{
        " MIPS IV
        syntax keyword mipsInstruction pref prefx
    "}}}

    " Coprocessor Operations {{{
        " MIPS I
        syntax keyword mipsInstruction cop1
    "}}}

    " Data Movement Instructions {{{
        " MIPS #?
        syntax keyword mipsInstruction move
        syntax keyword mipsInstruction mfc0 mfc1
        syntax keyword mipsInstruction mtc0 mtc1
        syntax keyword mipsInstruction movf movt
    "}}}

"}}}

" Constant-Manipulating Instructions {{{
    " MIPS #?
    syntax keyword mipsInstruction li
    syntax keyword mipsInstruction seq
    syntax keyword mipsInstruction sge sgeu
    syntax keyword mipsInstruction sgt sgtu
    syntax keyword mipsInstruction sle sleu
    syntax keyword mipsInstruction sne
"}}}

" Floating-Point Instructions {{{
syntax match mipsInstruction "abs\.d"
syntax match mipsInstruction "abs\.s"
syntax match mipsInstruction "add\.d"
syntax match mipsInstruction "add\.s"
syntax match mipsInstruction "ceil\.w\.d"
syntax match mipsInstruction "ceil\.w\.s"
syntax match mipsInstruction "c\.eq\.d"
syntax match mipsInstruction "c\.eq\.s"
syntax match mipsInstruction "c\.le\.d"
syntax match mipsInstruction "c\.le\.s"
syntax match mipsInstruction "c\.lt\.d"
syntax match mipsInstruction "c\.lt\.s"
syntax match mipsInstruction "cvt\.d\.s"
syntax match mipsInstruction "cvt\.d\.w"
syntax match mipsInstruction "cvt\.s\.d"
syntax match mipsInstruction "cvt\.s\.w"
syntax match mipsInstruction "cvt\.w\.d"
syntax match mipsInstruction "cvt\.w\.s"
syntax match mipsInstruction "div\.d"
syntax match mipsInstruction "div\.s"
syntax match mipsInstruction "floor\.w\.d"
syntax match mipsInstruction "floor\.w\.s"
syntax match mipsInstruction "l\.d"
syntax match mipsInstruction "l\.s"
syntax match mipsInstruction "mfc1\.d"
syntax match mipsInstruction "mov\.d"
syntax match mipsInstruction "mov\.s"
syntax match mipsInstruction "movf\.d"
syntax match mipsInstruction "movf\.s"
syntax match mipsInstruction "movt\.d"
syntax match mipsInstruction "movt\.s"
syntax match mipsInstruction "movn\.d"
syntax match mipsInstruction "movn\.s"
syntax match mipsInstruction "movz\.d"
syntax match mipsInstruction "movz\.s"
syntax match mipsInstruction "mul\.d"
syntax match mipsInstruction "mul\.s"
syntax match mipsInstruction "neg\.d"
syntax match mipsInstruction "neg\.s"
syntax match mipsInstruction "round\.w\.d"
syntax match mipsInstruction "round\.w\.s"
syntax match mipsInstruction "sqrt\.d"
syntax match mipsInstruction "sqrt\.s"
syntax match mipsInstruction "s\.d"
syntax match mipsInstruction "s\.s"
syntax match mipsInstruction "sub\.d"
syntax match mipsInstruction "sub\.s"
syntax match mipsInstruction "trunc\.w\.d"
syntax match mipsInstruction "trunc\.w\.s"
"}}}
"}}}

" Linking {{{
hi def link mipsComment        Comment
hi def link mipsNumber         Number
hi def link mipsString         String
hi def link mipsLabel          Label
hi def link mipsRegister       Identifier
hi def link mipsDirective      Type
hi def link mipsInstruction    Statement
"}}}

let b:current_syntax = "mips"
" vim:ft=vim:fdm=marker:ff=unix:foldopen=all:foldclose=all
