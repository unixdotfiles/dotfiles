. ~/.conf/zsh/exists.func

: ${LIBSH_ALERT_TIME:=3000}

alert() {
	text="$1"; shift;
	__exists Xdialog || return
	(Xdialog --title "pcm sound" --infobox "$text" 0 0 $LIBSH_ALERT_TIME &)
}
