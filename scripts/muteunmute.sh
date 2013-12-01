. ~/.conf/zsh/exists.func

alert() {
	text="$1"; shift;
	#__exists Xdialog || return
	(Xdialog --infobox "$text" 0 0 5000 &)
}
mute() {
	mixer pcm 0
	alert "Mute"
}

unmute() {
	mixer pcm 100
	alert "Unmute"
}
ismute=""
mixer -S pcm|grep -q 00 && ismute="yes";
[ -n "$ismute" ] && (mute) || unmute
