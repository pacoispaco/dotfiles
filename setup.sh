#!/usr/bin/env bash
# Script for setting up symlinks to dotfiles
# Copyright (c) 2016, 2022 Paul Cohen

set -e

dotfilesdir=~/proj/github/dotfiles      # Dotfiles directory
# List of dotfiles to symlink
dotfiles=".bashrc .vimrc .tmux.conf .gitconfig"
originalsdir=$dotfilesdir/originals     # Directory with original dotfiles

function moveoriginals () {
    # Move all files to be replaced by links, and that are not already symbolic
    # links, to the $originalsdir directory
    if [ ! -e $originalsdir ]; then
        printf "Create directory %s ... " "$originalsdir"
        mkdir $originalsdir
        printf "ok\n"
    fi;
    for file in $dotfiles; do
        if [ -e ~/$file ]; then
            if [ ! -L ~/$file ]; then
                printf "Move %s to %s ... " "$file" $originalsdir
                mv ~/$file $originalsdir
                printf "ok\n"
            fi;
        else
            printf "Original dotfile %s not found. No copy moved to %s\n" "$file" "$originalsdir"
        fi;
    done
}

function createlinks () {
    # Set up links
    for file in $dotfiles; do
        printf "Link ~/%s to %s ... " "$file" "$dotfilesdir/$file"
        ln -sf $dotfilesdir/$file ~/$file
        printf "ok\n"
    done
    # Source BASH files
    printf "Source ~/.bashrc ... "
    source ~/.bashrc
    printf "ok\n"
}

moveoriginals
createlinks

unset moveoriginals;
unset createlinks;
