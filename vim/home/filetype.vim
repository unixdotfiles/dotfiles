augroup filetypedetect
	au BufNewFile,BufRead ssh_config.* setf sshconfig
	au BufNewFile,BufRead *.json,.arclint,.arcconfig,.arcrc setf json
	au BufNewFile,BufRead *.[0-9] setf nroff
augroup END