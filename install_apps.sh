# vim install
sudo easy_install Mercurial
mkdir src
cd src
hg clone https://vim.googlecode.com/hg/ vim
cd vim/
./configure --prefix=/usr/local --enable-multibyte --with-features=huge --enable-fontset --enable-cscope --disable-selinux --disable-gui
make
sudo make install

