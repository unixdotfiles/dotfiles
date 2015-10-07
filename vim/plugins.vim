" Vundle
set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
nnoremap <Leader>nt :NERDTreeToggle<cr>
"Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
"Plugin 'ajh17/VimCompletesMe'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'PCGen/vim-pcgen.git'
"Plugin 'jmcantrell/vim-virtualenv'
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" NERDTree
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
	    \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let g:NERDSpaceDelims = 1

nnoremap <C-g> :NERDTreeTabsToggle<cr>

" a.vim
nnoremap <F2> :A<cr>

" VimCompleteMe
" imap <expr> <CR> pumvisible() ? "\<C-y> " : "\<CR>"

" YouCompleteMe
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.conf/vim/default_ycm_extra_conf.py'
