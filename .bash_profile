export PATH=/usr/local/bin:$PATH
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval `docker-machine env 2>/dev/null`

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/development/flutter/bin"

alias dotfiles='/usr/bin/git --git-dir=/Users/arturo/.dotfiles/ --work-tree=/Users/arturo'
