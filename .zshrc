source $HOME/.zsh/antigen/antigen.zsh

setopt nobeep
setopt auto_cd

source $HOME/.zsh/paths.zsh

# load zsh/*.zsh
for config_file ($HOME/.zsh/*.zsh); do
  source $config_file
done

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/opt/qt/bin:$PATH"

export CLOUDSDK_PYTHON=~/.pyenv/versions/2.7.14/bin/python

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/junji/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/junji/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/junji/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/junji/google-cloud-sdk/completion.zsh.inc'; fi
