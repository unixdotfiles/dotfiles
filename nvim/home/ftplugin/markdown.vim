setlocal list
autocmd BufWritePre <buffer> %s/\s\+$//e
