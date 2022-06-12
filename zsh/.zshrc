export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export HISTSIZE=1000

bindkey -e

source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/git", from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

# Key binding
bindkey -e

# PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/depot_tools:$PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"

export EDITOR='nvim'
export SHELL=$(which zsh)
alias vim='nvim'
alias vi='nvim'

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export FZF_DEFAULT_COMMAND='fd'

plugins=(
  git
  pyenv
  fzf
  fd
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export GOROOT=/usr/local/Cellar/go/1.15.6/libexec
# export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source /etc/profile.d/modules.sh

export PATH=$HOME/depot_tools:$PATH
