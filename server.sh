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

ssh-keygen

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
