# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

_Z_CMD=z
source ~/z/z.sh
precmd() {
    _z --add "$(pwd -P)"
}

# source ~/auto-fu.zsh/auto-fu.zsh
alias vim="/usr/local/bin/vim"
alias vi="vim"
export EDITOR="vim"
export PATH=~/perl5/perlbrew/bin:$PATH
export PATH=~/.nodebrew/current/bin:$PATH
export PATH=~/play-2.0.4:$PATH
export PATH=~/bin:$PATH
source ~/.profile
export PATH=/usr/local/etc/nginx:$PATH
export PATH=/usr/local/sbin:$PATH
# forgameview
export java_options="-xms64m -xmx512m -xss2m"

keychain id_rsa
. ~/.keychain/$HOST-sh

#renv
export PATH="$home/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#remove correct command
unsetopt correct_all
unsetopt correct

# Command history configuration
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000

# pythonbrew locally add
source $HOME/.pythonbrew/etc/bashrc

if [ -f ~/.projectrc ]; then
  source ~/.projectrc
fi

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)
