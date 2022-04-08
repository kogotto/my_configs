#!/bin/bash

ln -s $(realpath .gitconfig) ~/

mkdir -p ~/.config/nvim
ln -s $(realpath init.vim) ~/.config/nvim/

ln -s $(realpath .tmux.conf) ~/
