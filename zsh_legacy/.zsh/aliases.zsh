case ${OSTYPE} in
    darwin*)
    alias ls='ls -GF' ll='ls -al'
    alias grep='grep --color --no-messages --binary-files=without-match'
    ;;
    linux*)
    ;;
esac
alias vi=nvim
alias vim=nvim
export EDITOR=nvim
alias diff='diff -c'
alias gist='nkf -w | gist'
stty -ixon -ixoff
