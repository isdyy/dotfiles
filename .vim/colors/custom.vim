" Vim custom colorscheme

set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = 'custom'

" Currently gui not supported
"if has("gui_running") || &t_Co == 256
if &t_Co == 256

	hi Normal ctermfg=235 ctermbg=none

	hi SpecialKey ctermfg=grey ctermbg=none
	hi ColorColumn ctermbg=gray

	"hi Directory ctermfg=darkblue
	hi Directory ctermfg=24

	hi Comment ctermfg=242 ctermbg=none
	hi SpecialComment cterm=bold ctermfg=242 ctermbg=none

	"hi Constant ctermfg=darkred
	"hi Constant ctermfg=124
	hi Constant ctermfg=88
	hi link String          Constant
	hi link Character       Constant
	hi link Boolean         Constant

	hi Number ctermfg=30
	hi link Float Number

	"hi Statement cterm=bold ctermfg=52
	hi Statement cterm=bold ctermfg=16
	hi link Conditional     Statement
	hi link Repeat          Statement
	hi link Label           Statement
	hi link Operator        Statement
	hi link Keyword         Statement
	hi link Exception       Statement

	hi Identifier cterm=bold ctermfg=24
	hi link Function Identifier

	"hi PreProc cterm=bold ctermfg=52
	hi PreProc cterm=bold ctermfg=16
	hi link Include         PreProc
	hi link Define          PreProc
	hi link Macro           PreProc
	hi link PreCondit       PreProc

	"hi Type ctermfg=darkblue
	hi Type cterm=bold ctermfg=24
	hi link StorageClass    Type
	hi link Structure       Type
	hi link Typedef         Type

	"hi Special term=bold ctermfg=160 guifg=#dd1144
	hi Special term=bold ctermfg=88 guifg=#dd1144
	hi link SpecialChar Special
	hi Tag ctermfg=18 guifg=#000080
	hi link Delimiter Special
	hi link Debug Special

	"hi Underlined

	"hi Ignore

	"hi Error

	"hi Todo

	"hi link vimfunction     Function



	hi DiffAdd term=bold ctermfg=16 ctermbg=194 guifg=#000000 guibg=#ddffdd
	hi DiffChange term=bold ctermbg=225 guibg=LightMagenta
	hi DiffDelete term=bold ctermfg=16 ctermbg=224 gui=bold guifg=#000000 guibg=#ffdddd
	hi DiffText term=reverse cterm=bold ctermbg=240 gui=bold guibg=#666666
	hi link DiffAdded DiffAdd
	hi link DiffChanged DiffChange
	hi link DiffRemoved DiffDelete

	hi link PythonStatement Statement
	hi link PythonFunction Function
	hi link PythonConditional Conditional
	hi link PythonRepeat Repeat
	hi link PythonOperator Operator
	hi link PythonException Exception
	hi link PythonInclude Include
	hi link PythonDecorator Define
	hi link PythonTodo Todo
	hi link PythonComment Comment
	hi link PythonEscape Special
	hi link PythonString String
	hi clear PythonSpaceError
	hi link PythonDoctest Special
	hi link PythonRawString String
	hi link PythonNumber Number
	hi link PythonBuiltin Function
	hi link PythonExceptions Structure
	hi link PythonDoctestValue Define
	hi clear PythonSync

	hi RubySymbol ctermfg=90 guifg=#990073


else
	hi Normal ctermfg=black ctermbg=none
endif
