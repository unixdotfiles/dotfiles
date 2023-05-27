call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'grimreaper/vim-aurora-syntax'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'light'
let g:airline_skip_empty_sections = 1
" unicode symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'


" skip showing fileformat for 'obvious' cases
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
