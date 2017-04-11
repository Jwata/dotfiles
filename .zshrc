# fixed screen ctrl+r ctrl+a ctrl+e
bindkey -e

# zshrc export LANG=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#export LESSCHARSET=UTF-8

## history file path
HISTFILE=$HOME/.zsh-history
## num history on mmemory
HISTSIZE=10000
## num history on save
SAVEHIST=1000000

setopt prompt_subst
setopt nobeep
setopt auto_cd

# login check
watch=(notme)
LOGCHECK=10

# ignore ssl certificate when using git
export GIT_SSL_NO_VERIFY=true

# zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.zsh/paths.zsh

# load zsh/*.zsh
for config_file ($HOME/.zsh/*.zsh); do
  source $config_file
done

