#!/bin/bash

ln -s $(realpath .bash_aliases) ~/

ln -s $(realpath .gitconfig) ~/

mkdir -p ~/.config/nvim
ln -s $(realpath nvim-lua-config/init.lua) ~/.config/nvim/
ln -s $(realpath nvim-lua-config/lua) ~/.config/nvim/

sudo apt install -y zsh
ln -s $(realpath .zshrc) ~/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(realpath .tmux.conf) ~/

./kin kin

kin watching
kin trpt
