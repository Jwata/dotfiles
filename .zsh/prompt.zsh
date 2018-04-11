setopt prompt_subst
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=C vcs_info
    psvar[1]=$vcs_info_msg_0_
}

PROMPT=$'%3F%~%f\n%2F%n@%m%f %1% '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT="%1(v|%F{green}%1v%f|)"
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
setopt transient_rprompt
