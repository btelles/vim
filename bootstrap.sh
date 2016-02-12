#!/bin/bash

# This is a bootstrap script for setting up a fresh Ubuntu install.
# To use it, copy the following into your terminal:
#
#   curl -o- https://raw.githubusercontent.com/btelles/vim/master/bootstrap.sh | bash
#
# To undo most things, execute the following:
#
#   rm -rf .vim .rbenv .pyenv .nvm .ssh/id*h

echo -n "Installing dependencies"
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev git \
tmux

echo "Installing vim-gnome dependencies..."
sudo apt-get build-dep vim-gnome

echo "Enter the password for your ssh key:"
read pswd </dev/tty || { rc=$?; echo "Unable to read from TTY" >&2; exit "$rc"; }

echo "Generating ssh key..."
ssh-keygen -f ~/.ssh/id_rsa -N "$pswd"

echo "Add the following ssh key to my github account:"
cat ~/.ssh/id_rsa.pub

echo "Re-enter the password for your ssh key:"
ssh-add </dev/tty

echo "Cloning vim repo..."
git clone git@github.com:btelles/vim.git ~/.vim

echo "Installing vim submodules..."
(cd ~/.vim && git submodule init && git submodule update)

~/.vim/gnome-terminal-colors-solarized/install.sh -s light -p Default

echo "Linking preference files..."
ln -fs ~/.vim/.bashrc ~/
ln -fs ~/.vim/.gitconfig ~/
ln -fs ~/.vim/.tmux.conf ~/
ln -fs ~/.vim/.vimrc ~/
ln -fs ~/.vim/.ackrc ~/
ln -fs ~/.vim/.bash_aliases ~/
ln -fs ~/.vim/.bash_profile ~/
ln -fs ~/.vim/.rspec ~/
ln -fs ~/.vim/.autotest ~/

echo "installing VIM..."
(cd ~/.vim/vim &&
./configure \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --with-x \
    --with-python-config-dir=/usr/lib/python2.7/config > ${temp_file} &&
make -j 4 && sudo make install
)

echo "Copying Consolas font to local directory..."
mkdir -p ~/.fonts
cp ~/.vim/Consolas.ttf ~/.fonts

echo "Installing Rbenv..."
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure > ${temp_file} && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "Installing PyEnv..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
