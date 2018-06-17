alias vim="/usr/local/bin/vim"
alias vi="vim"
export EDITOR="vim"
export PATH=~/bin:$PATH
source ~/.profile

# git settings
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '

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


# added by travis gem
[ -f /Users/yosuke/.travis/travis.sh ] && source /Users/yosuke/.travis/travis.sh
