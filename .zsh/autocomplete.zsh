autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sa' -t '%j' ~/.zcompdump) ]; then
	compinit
else
	compinit -C
fi

setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
setopt list_packed
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^U" backward-kill-line
bindkey "[D" backward-word
bindkey "[C" forward-word

__git_files() { _files }
