eval "$(rbenv init -)"
export PS1='\[\033[33m\]\w $\[\033[0m\] '

export ELASTICPATH=/usr/local/Cellar/elasticsearch/2.3.0/libexec/bin/
export PATH=$PATH:$ELASTICPATH

alias ls='ls -G'
alias ll='ls -laG'
