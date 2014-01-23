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

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export GOENVTARGET=$HOME/.goenvtarget
export PATH=$GOENVTARGET:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $HOME/z/z.sh
function precmd () {
    _z --add "$(pwd -P)"
}

keychain id_rsa
. ~/.keychain/$HOST-sh


# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
export PATH=/usr/local/bin:$PATH
export PATH=/opt/vertica/bin:$PATH
# forgameview
#export java_options="-xms64m -xmx512m -xss2m"

keychain -q id_rsa
keychain -q community_key
keychain -q opecommon_key
. ~/.keychain/$HOST-sh

#renv
export PATH="$home/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#remove correct command
unsetopt correct_all
unsetopt correct

# Command history configuration
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# pythonbrew locally add
source $HOME/.pythonbrew/etc/bashrc

if [ -f ~/.projectrc ]; then
  source ~/.projectrc
fi

# zsh completions
fpath=(/usr/local/share/zsh-completions/src $fpath)

# 補完を有効化
autoload -Uz compinit
compinit -u

alias be='bundle exec'

# go env
export GOENVGOROOT=$HOME/.goenvs
export GOENVTARGET=$HOME/bin
export GOENVHOME=$HOME/workspace

export PATH=$GOROOT/bin:$PATH


function static_httpd {
  if type plackup > /dev/null; then
    plackup -MPlack::App::Directory -e 'Plack::App::Directory->new(root => ".")->to_app'
  elif type ruby > /dev/null; then
    if ruby -v | grep -qm1 'ruby 2\.'; then
      ruby -run -e httpd -- --port=5000 .
    else
      ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port => 5000, :DocumentRoot => ".").start'
    fi
  elif type python > /dev/null; then
    if python -V 2>&1 | grep -qm1 'Python 3\.'; then
      python -m http.server 5000
    else
      python -m SimpleHTTPServer 5000
    fi
  elif type node > /dev/null; then
    node -e "var c=require('connect'), d=process.env.PWD; c().use(c.logger()).use(c.static(d)).use(c.directory(d)).listen(5000);"
  elif type php > /dev/null && php -v | grep -qm1 'PHP 5\.[45]\.'; then
    php -S 0.0.0.0:5000
  elif type erl > /dev/null; then
    erl -eval 'inets:start(), inets:start(httpd, [{server_name, "httpd"}, {server_root, "."}, {document_root, "."}, {port, 5000}])'
  fi
}
