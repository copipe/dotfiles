parse_git_branch() {

   git branch 2> /dev/null | sed -e '/^[^​*]/d' -e 's/*​ \(.*\)/ (\1)/'

}

export PS1="$\[\e[36m\e[40m\][ \t \u@\w ]\[\e[0m\] \[\033[40;32m\]\$(parse_git_branch)\[\033[0m\]\n\\$"

alias ll='ls -alhG'
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
alias gg='git graph'

alias jl='jupyter lab'

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export PGDATA="/usr/local/var/postgres"
export PYTHONPATH=~/xgboost/python-package

# added by Miniconda3 installer
export PATH="/Users/TakayukiYagi/miniconda3/bin:$PATH"
eval "$(direnv hook bash)"
export EDITOR=vim
