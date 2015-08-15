ln -sFvh ~/config/dotfiles/aliases       ~/.aliases
# skip bin, config, fonts
ln -sFvh ~/config/dotfiles/gitconfig     ~/.gitconfig
ln -sFvh ~/config/dotfiles/gitignore     ~/.gitignore
ln -sFvh ~/config/dotfiles/pypirc        ~/.pypirc
ln -sFvh ~/config/dotfiles/tmux.conf     ~/.tmux.conf
ln -sFvh ~/config/dotfiles/vim           ~/.vim
ln -sFvh ~/config/dotfiles/vimrc         ~/.vimrc
ln -sFvh ~/config/dotfiles/zsh           ~/.zsh
ln -sFvh ~/config/dotfiles/zshrc         ~/.zshrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
