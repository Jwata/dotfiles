# fixed screen ctrl+r ctrl+a ctrl+e
bindkey -e

# zshrc
export LANG=en_US.UTF-8
#export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=UTF-8

## history file path
HISTFILE=$HOME/.zsh-history
## num history on mmemory
HISTSIZE=10000
## num history on save
SAVEHIST=1000000

## auto complete
autoload -U compinit
compinit
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

##limit dump size
# limit coredumpsize 102400

## color
setopt prompt_subst

##
setopt nobeep

# auto correct suggest
setopt correct

## VCS settings
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=C vcs_info
    psvar[1]=$vcs_info_msg_0_
}

# git file name complate fast setting
__git_files() { _files }

# プロンプト
PROMPT=$'%2F%n@%m%f %3F%~%f%1% '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT="%1(v|%F{green}%1v%f|)"
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
setopt transient_rprompt

# ディレクトリ名だけで移動できる。
setopt auto_cd

# aliases
case ${OSTYPE} in
    darwin*)
    alias ls='ls -GF' ll='ls -al'
    alias grep='grep --color --no-messages --binary-files=without-match'
    ;;
    linux*)
    ;;
esac
alias vi=nvim
alias vim=nvim
export EDITOR=nvim
alias diff='diff -c'
alias gist='nkf -w | gist'
stty -ixon -ixoff

# login check
watch=(notme)
LOGCHECK=10
#WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"

# ignore ssl certificate when using git
export GIT_SSL_NO_VERIFY=true

# zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# global enviroment variable
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export MANPATH=/usr/local/share/man:/usr/share/info:$MANPATH
export INFOPATH=/usr/local/share/info:/usr/share/info:$INFOPATH

export PATH=$HOME/.local/bin:$PATH

# neovim
export XDG_CONFIG_HOME=$HOME/.config

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# golang
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME"/go"
export PATH=$PATH:$GOPATH/bin

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH="./bin/:.bundle/bin:$PATH"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export CLOUDSDK_PYTHON="$PYENV_ROOT/versions/2.7.11/bin/python"
export PYTHONSTARTUP=~/.pythonrc.py
