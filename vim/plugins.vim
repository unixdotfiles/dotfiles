" {{{ Vundle 
set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'ajh17/VimCompletesMe'
Bundle 'vim-scripts/a.vim'

" }}}

" {{{ NERDTree
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
	    \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let g:NERDSpaceDelims = 1

nnoremap <C-g> :NERDTreeToggle<cr>
nnoremap <Leader>nt :NERDTreeToggle<cr>
" }}}

" {{{ a.vim
nnoremap <F2> :A<cr>
" }}}

" {{{ VimCompleteMe
imap <expr> <CR> pumvisible() ? "\<C-y> " : "\<CR>"
" }}}
