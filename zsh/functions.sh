__exists () {
      which $1 >/dev/null 2>&1;
      return $?;
}

__inSSH() {
	[ -n "$SSH_CONNECTION" ]
}
__isroot() {
    [ $(id -g) = 0 ]
}
