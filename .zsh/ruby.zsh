export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH="./bin/:.bundle/bin:$PATH"
