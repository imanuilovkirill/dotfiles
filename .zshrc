export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias t=tree
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
