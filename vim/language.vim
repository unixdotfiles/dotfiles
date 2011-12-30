if has("autocmd")
    au BufNewFile,BufRead *.rb call Set_Ruby()
    au BufNewFile,BufRead *.c,*.cpp call Set_C()
    au BufNewFile,BufRead *.php,*.html,*.css,*.js call Set_WWW()
    au BufNewFile,BufRead *.css call Set_CSS()
    au BufNewFile,BufRead *.js call Set_JavaScript()
    au BufNewFile,BufRead *.html,*.sgml,*.ent,*.xsl call Set_SGML()
    au BufNewFile,BufRead *.txt call Set_txt()
    au BufNewFile,BufRead crontab.* call Set_crontab()
    au BufNewFile,BufRead *.[1-9] call Set_Man()
endif " has(autocmd)

function Set_txt()
	setfiletype text
	return 0
endfunction

function Set_crontab()
	setlocal nowritebackup
	setlocal filetype=crontab
	return 0
endfunction

function Set_Ruby()
    setlocal textwidth=70
    return 0
endfunction " Set_Ruby()

function Set_C()
    setlocal textwidth=80

    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8

    return 0
endfunction " Set_C()

function Set_WWW()
"    source $HOME/.vim/matchit.vim
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=php.html
    setlocal ft=php.html
    return 0
endfunction " Set_WWW()

function Set_CSS()
"    source $HOME/.vim/matchit.vim
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=css
    setlocal ft=css
    return 0
endfunction " Set_CSS()

function Set_JavaScript()
    call SourceMatchit()
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=javascript
    setlocal ft=javascript
    return 0
endfunction " Set_JavaScript()

function Set_SGML()
    " Stolen from gjb
    call SourceMatchit()
    call ShowSpecial()
    setlocal nonumber
    syn match sgmlSpecial "&[^;]*;"
    setlocal syntax=sgml
    setlocal ft=sgml
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal textwidth=70
    setlocal tabstop=8
    setlocal formatoptions=tcq2l
    return 0
endfunction " Set_SGML()

function Set_Man()
	call ShowSpecial()
	setlocal tabstop=4
	setlocal shiftwidth=4
endfunction "Set_Man()

function ShowSpecial()
    " blackend gave me these
    setlocal list listchars=tab:>>,trail:*,eol:$
    hi nontext ctermfg=red
    return 0
endfunction " ShowSpecial()

function SourceMatchit()
    " http://www.vim.org/scripts/script.php?script_id=39
	"source $HOME/.vim/matchit.vim
    return 0
endfunction " SourceMatchit()
