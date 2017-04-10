parse_git_branch() {

   git branch 2> /dev/null | sed -e '/^[^​*]/d' -e 's/*​ \(.*\)/ (\1)/'

}

export PS1="$\[\e[36m\e[40m\][ \t \u@\w ]\[\e[0m\] \[\033[40;32m\]\$(parse_git_branch)\[\033[0m\]\n\\$"

alias ll='ls -alG'
alias h='history'

alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias glog='git log --oneline --decorate --color --graph'
alias gb='git branch'

alias jn='jupyter notebook'

alias imgcat='~/shellscript/imgcat.sh'

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PGDATA="/usr/local/var/postgres"

export PYTHONPATH=~/xgboost/python-package
