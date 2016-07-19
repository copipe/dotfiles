parse_git_branch() {

   git branch 2> /dev/null | sed -e '/^[^​*]/d' -e 's/*​ \(.*\)/ (\1)/'

}

export PS1="$\[\e[36m\e[40m\][ \t \u@\w ]\[\e[0m\] \[\033[40;32m\]\$(parse_git_branch)\[\033[0m\]\n\\$"
alias maxima='exec /Applications/Maxima.app/Contents/Resources/rmaxima.sh'
alias junb='ssh -i ~/.ssh/mykeypair.pem -N -f -L localhost:8888:localhost:8888 ec2-user@52.34.24.5'
alias ll='ls -alG'
alias h='history'
alias cpp='/usr/bin/clang++'

alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias glog='git log --oneline --decorate --color --graph'
alias gb='git branch'

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export PATH="$HOME/.rbenv/bin:$PATH" 
eval "$(rbenv init - zsh)"
