#!/bin/sh

# done manually for now
#   * keyboard layout > options > key sequence to kill x server

# remove the default Ubuntu cruft
rmdir Documents/ Music/ Public/ Pictures/ Templates/ Videos/ examples.desktop

# install some things we're going to want
sudo apt-get install aptitude
sudo aptitude install \
    build-essential libxslt1-dev \
    python3 python-dev python3-dev pypy pypy-dev ipython ipython3 \
    python-flake8 python-pip python-virtualenv virtualenvwrapper python-tox \
    zsh vim-nox exuberant-ctags git tmux \
    nautilus-dropbox meld gitg \
    ack-grep tree s3cmd mosh \
    gcolor2 libgnome2-bin \
    awesome awesome-extra \
    xfonts-terminus fonts-droid

chsh -s /bin/zsh
