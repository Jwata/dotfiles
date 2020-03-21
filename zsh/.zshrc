export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# editor
export EDITOR='nvim'
alias vim='nvim' 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path
export PATH=/usr/local/bin:$PATH
