if has("autocmd")
    au BufNewFile,BufRead *.rb call Set_Ruby()
    au BufNewFile,BufRead *.c,*.cpp call Set_C()
    au BufNewFile,BufRead *.php,*.html,*.css,*.js call Set_WWW()
    au BufNewFile,BufRead *.css call Set_CSS()
    au BufNewFile,BufRead *.js call Set_JavaScript()
    au BufNewFile,BufRead *.html,*.sgml,*.ent,*.xsl,*.xml call Set_SGML()
    au BufNewFile,BufRead *.txt call Set_txt()
    au BufNewFile,BufRead crontab.* call Set_crontab()
    au BufNewFile,BufRead *.vm call Set_Velocity() " TA
    au BufNewFile,BufRead *.[1-9] call Set_Man()
    au BufNewFile,BufRead *.py call Set_Python()
    au BufNewFile,BufRead *.in call Set_Automake()
    au Filetype gitcommit call Set_GitCommit()
    au BufNewFile,BufRead log call Set_SVNLog()
    au BufNewFile,BufRead *.sh,*.bash call Set_Shell()
    au BufNewFile,BufRead *.json call Set_Json()

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

function Set_Automake()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal expandtab

    return 0
endfunction " Set_Automake()

function Set_Json()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal expandtab

    return 0
endfunction " Set_Automake()

function Set_WWW()
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=php.html
    setlocal ft=php.html
    return 0
endfunction " Set_WWW()

function Set_CSS()
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal syntax=css
    setlocal ft=css
    return 0
endfunction " Set_CSS()

function Set_JavaScript()
    setlocal textwidth=78
    setlocal tabstop=4
    setlocal ft=javascript
    return 0
endfunction " Set_JavaScript()

function Set_SGML()
    " Stolen from gjb
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
    setlocal cc=+1
    return 0
endfunction " Set_SGML()

function Set_Man()
	call ShowSpecial()
	setlocal tabstop=4
	setlocal shiftwidth=4
endfunction "Set_Man()

function Set_Velocity()
	setlocal expandtab
	setlocal softtabstop=2
	setlocal sw=2
	setlocal ts=2
endfunction "Set_Velocity()

function Set_Python()
	set ft=python
	setlocal expandtab
	setlocal softtabstop=4
	setlocal shiftwidth=4
	setlocal tabstop=4
endfunction

function Set_GitCommit()
	 setlocal spell
	 setlocal textwidth=72
	 setlocal cc=+1
endfunction

function Set_SVNLog()
	 setlocal spell
	 setlocal textwidth=80
	 setlocal cc=+1
endfunction

function Set_Shell()
	setlocal expandtab
	setlocal softtabstop=4
	setlocal sw=4
	setlocal ts=4
endfunction

function ShowSpecial()
    " blackend gave me these
    setlocal list listchars=tab:>>,trail:*,eol:$
    hi nontext ctermfg=red
    return 0
endfunction " ShowSpecial()

