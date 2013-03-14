alias vim="/usr/local/bin/vim"
alias vi="vim"
export EDITOR="vim"
export PATH=~/perl5/perlbrew/bin:$PATH
export PATH=~/.nodebrew/current/bin:$PATH
export PATH=~/play-2.0.4:$PATH
export PATH=~/bin:$PATH
source ~/.profile
# ForGameView
export PATH=/usr/local/etc/nginx:$PATH
export PATH=/usr/local/sbin:$PATH
export _JAVA_OPTIONS="-Xms64m -Xmx512m -Xss2m"

keychain id_rsa
. ~/.keychain/$HOSTNAME-sh

# git settings
source /usr/local/git/contrib/completion2/git-prompt.sh
source /usr/local/git/contrib/completion2/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '

#renv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#search
function search() { 
  dir=.
  file=*
  case $# in
    0)
    echo usage: search STRING [DIR [FILE]]
    ;;
    1) 
    string=$1
    ;;
    2)
    string=$1
    dir=$2
    ;;
    3)
    string=$1
    dir=$2
    file=$3
    ;;
  esac  
  find $dir -name "$file" -exec grep -d skip -IHn $string {} \; ;
}

