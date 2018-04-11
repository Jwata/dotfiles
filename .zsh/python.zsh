# export PYTHONSTARTUP=~/.pythonrc.py
# export PATH="$HOME"/miniconda3/bin:$PATH
# 
# if [ `command -v conda` ];then
# elif [ `command -v pyenv` ];then
#   export PYENV_ROOT=/usr/local/var/pyenv
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   pyenv() {
#     eval "$( command pyenv init - )"
#     eval "$(pyenv virtualenv-init -)"
#     pyenv "$@"
#   }
# fi
export PYTHONSTARTUP=~/.pythonrc.py
. /usr/local/miniconda3/etc/profile.d/conda.sh
export PATH=/usr/local/miniconda3/bin:"$PATH"
