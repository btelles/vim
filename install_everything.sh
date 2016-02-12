#!/bin/bash


echo "Installing dependencies"
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev git

echo "Generating ssh key..."
echo "Enter the password for your ssh key:"
read pswd
ssh-keygen -f ~/.ssh/id_rsa -N $pswd

echo "Add the following ssh key to my github account:"
cat ~/.ssh/id_rsa.pub
read -p "Press [Enter] key to continue..."

echo "Cloning vim repo..."
git clone git@github.com:btelles/vim.git ~/.vim

echo "Linking preference files..."
ln -fs ~/.vim/.bashrc ~/
ln -fs ~/.vim/.gitconfig ~/
ln -fs ~/.vim/..tmux.conf ~/
ln -fs ~/.vim/.vimrc ~/
ln -fs ~/.vim/.ackrc ~/
ln -fs ~/.vim/.bash_aliases ~/
ln -fs ~/.vim/.bash_profile ~/
ln -fs ~/.vim/.rspec ~/
ln -fs ~/.vim/.autotest ~/

echo "Installing vim submodules..."
(cd ~/.vim && git submodule init && git submodule update)

echo "Installing Rbenv..."
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "Installing PyEnv..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

. ~/.bashrc
