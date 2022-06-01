function! EnsureDirExists (dirarg)
    let l:dir=expand(a:dirarg)
    if !isdirectory(l:dir)
        call mkdir(l:dir,'p')
    endif
endfunction

" disable higlighting from search
nnoremap Q :noh<RETURN>
"S -- split line at char under cursor
nnoremap S i<RETURN><ESC>==k$


let mapleader = ","

nmap <leader>n :bnext<CR>
nmap <leader>p :bprevious<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Vim Files
set backupdir=~/.vim/backup
call EnsureDirExists(&backupdir)
" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
au BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'

" for swap file
set directory+=~/.vim/swap// " double / so that the complete path gets used
set directory+=.
call EnsureDirExists("~/.vim/swap")

" Automatically cd into the directory that the file is in
set autochdir

if has("persistent_undo")
	set undodir=~/.vim/undo
	set undofile
	set undoreload=10000	"maximum number lines to save for undo on a buffer reload
    call EnsureDirExists(&undodir)
endif
set undolevels=1000		"maximum number of changes that can be undone

