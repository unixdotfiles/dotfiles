# __ prefix = internal function
#  _ prefix = shellrc function
# no prefix = user function

__exists () {
  while [ -n "$1" ];
  do
    local cmd="$1"; shift
    which "$cmd" >/dev/null 2>&1 || return 1
  done
  return 0;
}

redefine() {
  full="$1"
  cmd="${full%%=*}"
  __exists "$cmd" && alias "$full"
}

__osx_define_alias() {
  name="$1"
  cmd="$2"
  [ -r "$cmd" ] && alias "$name"="open $cmd --args"
}

__inSSH() {
	[ -n "$SSH_CONNECTION" ]
}
__isroot() {
    [ $UID ] && return $UID
    [ $(id -g) = 0 ]
}

__tmux_restore_ssh_env() {
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
    echo $SOCKETS | while read -r sock
    do
        SSH_AUTH_SOCK="$sock" __sshagent_keysloaded
        if [ $? -eq 0 ]
        then
            export SSH_AUTH_SOCK="$sock"
            return
        fi
    done

}

# return 0 if the agent has keys loaded; else 0.
__sshagent_keysloaded() {
    ssh-add -l 2>/dev/null |grep -iqE '(RSA|DSA|ECDSA|ed25519)'
}

__ensure_sshagent() {
    __sshagent_keysloaded || __tmux_restore_ssh_env
    __sshagent_keysloaded || __aggressive_ssh_agent_restore
    __sshagent_keysloaded || ssh-add
    true
}

__ensure_kinit() {
    /usr/bin/klist -t 2>/dev/null || /usr/bin/kinit --keychain &
}

ensure_auth() {
  case "$__shellrc_auth_mode" in
    "")
      ;;
    "ssh")
      __ensure_sshagent
      ;;
    "kinit")
      __ensure_kinit
      ;;
  esac
}

msource() {
	local f="$1";
	[ -f "$f" ] && . "$f";
}


: ${LIBSH_ALERT_TIME:=3000}

_alert() {
	text="$1";
	title="$2";
	__exists Xdialog || return
	(Xdialog --title "$title" --infobox "$text" 0 0 "$LIBSH_ALERT_TIME" &)
}

if [ "$(uname -s)" = "Darwin" ]
then
  sethostname() {
    local name
    name="${1?:hostname is required}"
    hostname "$name"
    scutil --set LocalHostName "$1"
    scutil --set HostName "$1"
  }
fi
