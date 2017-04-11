export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export CLOUDSDK_PYTHON="$PYENV_ROOT/versions/2.7.11/bin/python"
export PYTHONSTARTUP=~/.pythonrc.py
