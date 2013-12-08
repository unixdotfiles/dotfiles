. ~/.conf/scripts/lib.sh

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
