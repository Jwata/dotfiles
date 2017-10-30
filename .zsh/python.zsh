if [ `command -v pyenv` ];then
  export PYENV_ROOT=/usr/local/var/pyenv
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PYTHONSTARTUP=~/.pythonrc.py
export PATH=/usr/local/miniconda3/bin:"$PATH"
