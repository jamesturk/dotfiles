#!/bin/sh

# build the actual box
hostname ego
echo ego > /etc/hostname
mkfs.xfs /dev/xvdb
mkdir /home/james
mount -t xfs /dev/xvdb /home/james
echo '/dev/xvdb /home/james xfs defaults 0 0' >> /etc/fstab
adduser james
usermod -aG sudo james
chown james:james /home/james/

# install things
apt-get update
apt-get install python-dev python-pip python3-dev python3-pip
apt install tmux tree fish silversearcher-ag docker-compose
# neovim
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim

####### rest of file as james

ssh-keygen
# added to GitHub

# add links
mkdir ~/.config
ln -sFv ~/config/dotfiles/gitconfig ~/.gitconfig
ln -sFv ~/config/dotfiles/tmux.conf ~/.tmux.conf
ln -sFv ~/config/dotfiles/config/fish ~/.config/fish 
ln -sFv ~/config/dotfiles/config/git ~/.config/git 
ln -sFv ~/config/dotfiles/config/nvim ~/.config/nvim 

# fish
pip install virtualfish
chsh -s /usr/bin/fish james

# virtualenvs
mkdir ~/.virtualenvs
virtualenv -p `which python2` ~/.virtualenvs/neovim2
virtualenv -p `which python3` ~/.virtualenvs/neovim3
~/.virtualenvs/neovim2/bin/pip install neovim 
~/.virtualenvs/neovim3/bin/pip install neovim
