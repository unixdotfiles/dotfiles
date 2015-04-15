" Vundle
set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
"Bundle 'ajh17/VimCompletesMe'
Plugin 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/a.vim'

" NERDTree
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
	    \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let g:NERDSpaceDelims = 1

nnoremap <C-g> :NERDTreeToggle<cr>
nnoremap <Leader>nt :NERDTreeToggle<cr>

" a.vim
nnoremap <F2> :A<cr>

" VimCompleteMe
" imap <expr> <CR> pumvisible() ? "\<C-y> " : "\<CR>"

" YouCompleteMe
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.conf/vim/default_ycm_extra_conf.py'
