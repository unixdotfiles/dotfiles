[[ -z "$terminfo[kdch1]" ]]  || bindkey -M emacs "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]]  || bindkey -M emacs "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]"  ]]  || bindkey -M emacs "$terminfo[kend]"  end-of-line
[[ -z "$terminfo[kcuu1]" ]]  || bindkey -M emacs "$terminfo[kcuu1]" up-line-or-history
[[ -z "$terminfo[kcud1]" ]]  || bindkey -M emacs "$terminfo[kcud1]" up-line-or-history
[[ -z "$terminfo[kich1]" ]]  || bindkey -M emacs "$terminfo[kich1]" overwrite-mode


#[[ -z "$terminfo[kich1]" ]]  || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode
#[[ "$terminfo[kcuu1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
#[[ "$terminfo[kcud1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history

bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5C' forward-word # C-left
bindkey '^[[1;5D' backward-word # C-right
bindkey '^[[H' beginning-of-line # home
bindkey '^[[F' end-of-line
