#!/bin/sh

# done manually for now
#   * install chrome
#   * keyboard layout > options > key sequence to kill x server

# remove the default Ubuntu cruft
rmdir Documents/ Music/ Public/ Pictures/ Templates/ Videos/ examples.desktop

# fix some bad decisions that Ubuntu made
sudo apt-get install aptitude

# install some things we're going to want
sudo aptitude install \
    build-essential python-dev libxslt-dev \
    python-pip python-virtualenv virtualenvwrapper \
    git mercurial subversion \
    nautilus-dropbox terminator meld gitg \
    ack-grep tree s3cmd mosh \
    mongodb vim-nox exuberant-ctags \
    gcolor2 inkscape \
    python-flake8 ipython ipython3 \
    awesome awesome-extra
