# vim install
sudo easy_install Mercurial
mkdir src
cd src
git clone https://github.com/vim/vim.git
cd vim/
./configure --prefix=/usr/local --enable-multibyte --with-features=huge --enable-fontset --enable-cscope --disable-selinux --disable-gui
make
sudo make install

# neobundle install
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install mosh
brew install mobile-shell

# install tig
brew install tig

# install hub
brew install hub

# pythonbrew
curl -kL http://xrl.us/pythonbrewinstall | bash

# nodebrew
curl -L git.io/nodebrew | perl - setup

# zsh
brew install zsh

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

# install z
cd $HOME
git clone https://github.com/rupa/z.git

# install ag
brew install the_silver_searcher

# install zsh-completions
brew install zsh-completions

# install brew cask
brew tap caskroom/cask

# install chrome
brew cask install google-chrome

# install NeoBundle
vim -c ':NeoBundleInstall!' -c ':q!' 

# install bazaar
brew install bzr

# install ack
brew install ack


