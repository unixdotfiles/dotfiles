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

__tmux_restore_env() {
    [ -z "$TMUX" ] && return
    local temp_sock
    temp_sock=$(tmux show-environment |grep SSH_AUTH_SOCK)
    if [ ${temp_sock%*=*} = "SSH_AUTH_SOCK" ]; then
        export $temp_sock
    fi
}

# Check filesystem for what might be an ssh socket and attempt to use it.
__aggressive_ssh_agent_restore() {
    SOCKETS="$(find /tmp/ssh-* -maxdepth 1 -mindepth 1 -type s -name 'agent.*' 2>/dev/null)"
    echo $SOCKETS | while read sock
    do
        SSH_AUTH_SOCK=$sock __sshagent_keysloaded
        if [ $? -eq 0 ]
        then
            export SSH_AUTH_SOCK="$sock"
        fi
    done

}

# return 0 if the agent has keys loaded; else 0.
__sshagent_keysloaded() {
    ssh-add -l 2>/dev/null |grep -qE '(RSA|DSA|ECDSA)'
}

__ensure_sshagent() {
    __sshagent_keysloaded || __tmux_restore_env
    __sshagent_keysloaded || __aggressive_ssh_agent_restore
    __sshagent_keysloaded || ssh-add
}

define_remote_alias() {
    eval $(__create_remote_alias "$@")
}
