# PATH
export PATH=/usr/local/bin:$PATH

# editor
export EDITOR='nvim'
alias vim='nvim' 

# theme
ZSH_THEME="robbyrussell"

plugins=(
  git
  pyenv
  fzf
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
