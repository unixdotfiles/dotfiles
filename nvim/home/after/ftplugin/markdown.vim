setlocal list
setlocal spell
autocmd BufWritePre <buffer> %s/\s\+$//e

