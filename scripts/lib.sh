. ~/.conf/zsh/exists.func

alert() {
	text="$1"; shift;
	__exists Xdialog || return
	(Xdialog --title "pcm sound" --infobox "$text" 0 0 3000 &)
}
