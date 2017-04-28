ln -sFvh ~/config/dotfiles/aliases       ~/.aliases
# skip bin, config, fonts
ln -sFvh ~/config/dotfiles/gitconfig     ~/.gitconfig
ln -sFvh ~/config/dotfiles/gitignore     ~/.gitignore
ln -sFvh ~/config/dotfiles/pypirc        ~/.pypirc
ln -sFvh ~/config/dotfiles/tmux.conf     ~/.tmux.conf
ln -sFvh ~/config/dotfiles/zsh           ~/.zsh
ln -sFvh ~/config/dotfiles/zshrc         ~/.zshrc

pip install pgcli virtualenv virtualenvwrapper powerline-status powerline-gitstatus
