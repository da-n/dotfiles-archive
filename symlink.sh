#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

DATE=$(date +"%Y%m%d%H%M%S")
OK="\033[0;32m...done\033[39m"
DIR=$HOME/.dotfiles                    # dotfiles directory
DIR_BAK=$HOME/.dotfiles.bak             # old dotfiles backup directory
FILES="aliases gitignore_global zprofile zshrc oh-my-zsh tmux.conf"    # list of files/folders to symlink in homedir

##########

# Fetch any git submodules
echo "Check/fetch git submodules"
git submodule update --init
echo $OK

# create dotfiles_old in homedir
echo "Create backup directory \033[1;34m$DIR_BAK/$DATE\033[39m"
mkdir -p $DIR_BAK
mkdir -p $DIR_BAK/$DATE
echo $OK

# change to the dotfiles directory
cd $DIR

# move any existing dotfiles in homedir to dotfiles_old directory
echo "Move existing dotfiles to backup folder \033[1;34m$DIR_BAK/$DATE\033[39m"
for FILE in $FILES; do
    mv $HOME/.$FILE $DIR_BAK/$DATE
done
echo $OK

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Add new dotfile symlinks to home directory \033[1;34m$HOME\033[39m"
for FILE in $FILES; do
    ln -s $DIR/$FILE $HOME/.$FILE
done
echo $OK

echo "To change your shell:"
echo "$ sudo chsh -s $(which zsh) $USER"
