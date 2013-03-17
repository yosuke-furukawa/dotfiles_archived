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

brew install mosh
brew install tig
brew install hub

# perlbrew
curl -kL http://install.perlbrew.pl | bash
curl -L http//cpanmin.us/ | perl - App::cpanminus

# pythonbrew
curl -kL http://xrl.us/pythonbrewinstall | bash

# nodebrew
curl -L git.io/nodebrew | perl - setup

# install z
cd $HOME
git clone https://github.com/rupa/z.git
