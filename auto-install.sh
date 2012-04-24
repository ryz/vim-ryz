#!/bin/sh
VIMHOMEDIR=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "Installing ryz' Vim configuration..."
echo

# check if git is installed
command -v git >/dev/null 2>&1 || { echo >&2 "Git is required, but not found! Aborting."; exit 1; }

# check if vim is installed
command -v vim >/dev/null 2>&1 || { echo >&2 "Vim is required, but not found! Aborting."; exit 1; }

# check if Vim/vimrc already exists
[ -e "$VIMHOMEDIR/vimrc" ] && die "$VIMHOMEDIR/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."


cd ~
git clone --recursive http://github.com/ryz/vim-ryz.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

echo
cd $VIMHOMEDIR 
mkdir -v tmp
mkdir -v backup
mkdir -v undo

echo
echo "ryz' .vim was successfully installed and configured, have fun!"

# deprecated, only needed before Git version 1.6.5
# cd ~/.vim
# git submodule update --init
