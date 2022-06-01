" disable higlighting from search
nnoremap Q :noh<RETURN>
"S -- split line at char under cursor
nnoremap S i<RETURN><ESC>==k$


let mapleader = ","

nmap <leader>n :bnext<CR>
nmap <leader>p :bprevious<CR>

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
