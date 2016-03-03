augroup filetypedetect
	au BufNewFile,BufRead ssh_config.* setf sshconfig
	au BufNewFile,BufRead *.json,.arclint,.arcconfig,.arcrc setf json
augroup END
