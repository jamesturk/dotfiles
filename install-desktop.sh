#!/bin/sh

# done manually for now
#   * install chrome
#   * keyboard layout > options > key sequence to kill x server

# remove the default Ubuntu cruft
rmdir Documents/ Music/ Public/ Pictures/ Templates/ Videos/ examples.desktop



# install some things we're going to want
sudo apt-get install aptitude
sudo aptitude install \
    build-essential python-dev libxslt-dev \
    python-flake8 ipython ipython3 python-pip python-virtualenv virtualenvwrapper \
    git mercurial subversion \
    nautilus-dropbox terminator meld gitg \
    ack-grep tree s3cmd mosh \
    mongodb postgresql sqllite3 \
    vim-nox exuberant-ctags \
    gcolor2 inkscape keepassx \
    awesome awesome-extra

chsh -s /bin/zsh
