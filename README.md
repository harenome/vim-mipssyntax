vim-mipssyntax
==============
MIPS Syntax file.

This is a fork of [mips.vim](http://www.vim.org/scripts/script.php?script_id=2045 "mips.vim: Your standard MIPS syntax highlighting") by [Alex Brick](http://www.vim.org/account/profile.php?user_id=13254 "User Profile: Alex Brick"). In order to improve Alex Brick's syntax file, I processed [GNU Binutils](https://www.gnu.org/software/binutils/ "GNU Binutils")'s ```opcodes/mips.c``` and ```include/opcode/mips.h``` files using ```grep```, ```cut```, ```sort``` and ```comm```.

Revisions supported
-------------------
This syntax file should support the following revisions of the MIPS instruction set:
- MIPS I
- MIPS II
- MIPS III
- MIPS IV
- MIPS V
- MIPS 32
- MIPS 64

It also supports a few pseudo instructions such as ```subi``` or ```subiu``` and additionnal directives such as [MARS](http://courses.missouristate.edu/KenVollmar/MARS/index.htm "MARS MIPS Siulator")'s ```.macro```, ```.eqv``` and ```.include``` directives.

Installation
------------
### Regular installation
Just put the file ```mips.vim``` in your ```~/.vim/syntax``` folder.

### Pathogen
If you're using pathogen, you can also:
````
cd ~/.vim/bundle
git clone git://github.com/HarnoRanaivo/vim-mipssyntax.git
````
Unless you are managing your vim files using git, in which case you will need to use gitmodules. Go to the root of your repository and type:
````
git submodule add git://github.com/HarnoRanaivo/vim-mipssyntax.git [<path to .vim/bundle>/vim-mipssyntax]
````
Remember you will need to init and update your submodules on your other computers:
````
git submodule init
git submodule update
````

Highlights
----------
If you want to be able to tell the difference between actual instructions, aliases, macros and pseudo instructions, change the lines ```466``` to ```476``` to something like this, for instance:
````
hi def link mipsComment             Comment
hi def link mipsNumber              Number
hi def link mipsString              String
hi def link mipsLabel               Label
hi def link mipsRegister            Identifier
hi def link mipsDirective           Type
hi def link mipsInstruction         Statement
hi def link mipsAlias               PreProc
hi def link mipsMacro               PreProc
hi def link mipsPseudoInstruction   Special
hi def link mipsPseudoDirective     Special
````
Of course, this requires your colorscheme to set different colours for these highlights.
