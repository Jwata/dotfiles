# PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/depot_tools:$PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"

# editor
export EDITOR='nvim'
alias vim='nvim'
alias vi='nvim'

# theme
ZSH_THEME="robbyrussell"

export FZF_DEFAULT_COMMAND='fd'

plugins=(
  git
  pyenv
  # fzf
  fd
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
