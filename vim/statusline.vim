set statusline=		"In the event of a vimrc reload
set statusline+=%n:     "buffer number
set statusline+=%t      "tail of the filename
set statusline+=%m      "modified flag
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%w      "preview flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=[%{&fo}] "vim format-options

set statusline+=%=      "left/right separator


set statusline+=%c,     "cursor column
set statusline+=%l/%L\ (%O)   "cursor line/total lines (byte number)
set statusline+=\ %P    "percent through file


"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" change the status line based on mode
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
