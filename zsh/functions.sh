__exists () {
      which $1 >/dev/null 2>&1;
      return $?;
}

__inSSH() {
	[ -n "$SSH_CONNECTION" ]
}
__isroot() {
    [ $UID ] && return $UID
    [ $(id -g) = 0 ]
}

__create_remote_alias() {
    cmd="$1"; shift 1
    remote="$1"; shift 1
    printf '%s() { ssh -t -q "%s" "%s" "$@"} \n' "$cmd" "$remote" "$cmd"
}

define_remote_alias() {
    eval $(__create_remote_alias "$@")
}
