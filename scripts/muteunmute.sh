#!/bin/sh
. ~/.conf/common_shell/functions.sh

mute() {
	mixer pcm 0
	_alert "Mute" "PCM sound"
}

unmute() {
	mixer pcm 100
	_alert "Unmute" "PCM sound"
}
ismute=""
mixer -S pcm|grep -q 00 && ismute="yes";
[ -n "$ismute" ] && (mute || unmute)
