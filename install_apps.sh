# vim install
sudo easy_install Mercurial
mkdir src
cd src
hg clone https://vim.googlecode.com/hg/ vim
cd vim/
./configure --prefix=/usr/local --enable-multibyte --with-features=huge --enable-fontset --enable-cscope --disable-selinux --disable-gui
make
sudo make install

# neobundle install
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


# brew
ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)

# install mosh
brew install mobile-shell

# install tig
brew install tig

# install hub
brew install hub

# perlbrew
curl -kL http://install.perlbrew.pl | bash
curl -L http//cpanmin.us/ | perl - App::cpanminus

# pythonbrew
curl -kL http://xrl.us/pythonbrewinstall | bash

# nodebrew
curl -L git.io/nodebrew | perl - setup

# zsh
brew install zsh

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

# install z
cd $HOME
git clone https://github.com/rupa/z.git

# install ack
brew install ack
