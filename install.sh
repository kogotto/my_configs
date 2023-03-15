#!/bin/bash

ln -s $(realpath .bash_aliases) ~/

ln -s $(realpath .gitconfig) ~/

mkdir -p ~/.config/nvim
ln -s $(realpath init.vim) ~/.config/nvim/

ln -s $(realpath .tmux.conf) ~/

./kin kin

kin watching
