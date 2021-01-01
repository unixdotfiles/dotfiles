if has("autocmd")
	au Filetype ruby call Set_Ruby()
	au Filetype c,cpp call Set_C()
	au Filetype php call Set_PHP()
	au Filetype css call Set_CSS()
	au Filetype javascript call Set_JavaScript()
	au Filetype html,sgml,xsl,xml,docbk call Set_SGML()
	au Filetype crontab call Set_crontab()
	au BufNewFile,BufRead *.vm call Set_Velocity() " TA
	au Filetype nroff call Set_Man()
	au Filetype python  call Set_Python()
	au BufNewFile,BufRead *.in call Set_Automake()
	au Filetype gitcommit call Set_CommitLog()
	au BufNewFile,BufRead log call Set_CommitLog()
	au Filetype sh  call Set_Shell()
	au Filetype zsh call Set_Shell()
	au Filetype json call Set_Json()
	au Filetype vim call Set_Vim()
	au Filetype ini,yml,yaml call Set_Ini()
	au Filetype vhdl call Set_hdl()
endif " has(autocmd)

function Shared_Tabs(len)
	let &tabstop = a:len
	let &shiftwidth = a:len
	let &softtabstop = a:len
endfunction

function Set_crontab()
	setlocal nowritebackup
endfunction

function Set_hdl()
	call Shared_Tabs(4)
endfunction

function Set_Ruby()
	setlocal textwidth=70
endfunction " Set_Ruby()

function Set_C()
	setlocal textwidth=80
	call Shared_Tabs(4)
endfunction " Set_C()

function Set_Automake()
	call Shared_Tabs(8)
	setlocal expandtab
endfunction " Set_Automake()

function Set_Json()
	call Shared_Tabs(2)
	setlocal expandtab
endfunction " Set_Json()

function Set_PHP()
	call Shared_Tabs(2)
	set expandtab
	setlocal textwidth=78
endfunction " Set_PHP()

function Set_WWW()
	setlocal textwidth=78
endfunction " Set_WWW()

function Set_CSS()
	setlocal textwidth=78
	setlocal tabstop=4
endfunction " Set_CSS()

function Set_JavaScript()
	setlocal textwidth=78
	call Shared_Tabs(4)
endfunction " Set_JavaScript()

function Set_SGML()
	" Stolen from gjb
	call ShowSpecial()
	setlocal nonumber
	syn match sgmlSpecial "&[^;]*;"
	setlocal shiftwidth=2
	setlocal softtabstop=2
	setlocal textwidth=70
	setlocal tabstop=8
	setlocal formatoptions=tcq2l
	setlocal cc=+1
	setlocal expandtab
endfunction " Set_SGML()

function Set_Man()
	call ShowSpecial()
	call Shared_Tabs(4)
endfunction "Set_Man()

function Set_Velocity()
	setlocal expandtab
	call Shared_Tabs(2)
endfunction "Set_Velocity()

function Set_Python()
	setlocal expandtab
	call Shared_Tabs(4)
endfunction

function Set_CommitLog()
	setlocal spell
	setlocal textwidth=72
	setlocal cc=+1
endfunction

function Set_Shell()
	setlocal expandtab
	call Shared_Tabs(2)
endfunction

function Set_Vim()
	call Shared_Tabs(4)
endfunction

function Set_Ini()
	call Shared_Tabs(2)
endfunction

function ShowSpecial()
	" blackend gave me these
	setlocal list listchars=tab:>>,trail:*,eol:$
	hi nontext ctermfg=red
endfunction " ShowSpecial()
