if has("autocmd")
    au BufNewFile,BufRead *.rb call Set_Ruby()
    au BufNewFile,BufRead *.c,*.cpp call Set_C()
    au BufNewFile,BufRead *.php,*.html,*.css,*.js call Set_WWW()
    au BufNewFile,BufRead *.css call Set_CSS()
    au BufNewFile,BufRead *.js call Set_JavaScript()
    au BufNewFile,BufRead *.sgml,*.ent,*.xsl call Set_SGML()
    au BufNewFile,BufRead *.[1-9] call ShowSpecial()
    au FileType mail,tex call Set_Mutt()
endif " has(autocmd)

function Set_Ruby()
    setlocal textwidth=70
    return 0
endfunction " Set_Ruby()

function Set_C()
    setlocal textwidth=78
    setlocal shiftwidth=4
    setlocal softtabstop=4
    return 0
endfunction " Set_C()

function Set_WWW()
    source $HOME/.vim/matchit.vim
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=php.html
    setlocal ft=php.html
    return 0
endfunction " Set_WWW()

function Set_CSS()
    source $HOME/.vim/matchit.vim
    setlocal ruler
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=css
    setlocal ft=css
    return 0
endfunction " Set_CSS()

function Set_JavaScript()
    call SourceMatchit()
    setlocal ruler
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=javascript
    setlocal ft=javascript
    return 0
endfunction " Set_JavaScript()

function Set_SGML()
    call SourceMatchit()
    call ShowSpecial()
    setlocal nonumber
    syn match sgmlSpecial "&[^;]*;"
    setlocal syntax=sgml
    setlocal ft=sgml
    setlocal shiftwidth=2
    setlocal textwidth=72
    setlocal tabstop=8
    return 0
endfunction " Set_SGML()

function Set_Mutt()
    setlocal textwidth=72
    setlocal noruler
    setlocal nonumber
    return 0
endfunction " Set_Mutt()

function ShowSpecial()
    " blackend gave me these
    setlocal list listchars=tab:>>,trail:*,eol:$
    hi nontext ctermfg=red
    return 0
endfunction " ShowSpecial()


