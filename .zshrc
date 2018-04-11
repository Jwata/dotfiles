source $HOME/.zsh/antigen.zsh

setopt nobeep
setopt auto_cd

source $HOME/.zsh/paths.zsh

# load zsh/*.zsh
for config_file ($HOME/.zsh/*.zsh); do
  source $config_file
done

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/opt/qt/bin:$PATH"
