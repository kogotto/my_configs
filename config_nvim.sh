#!/bin/bash

mkdir -p ~/.config/nvim
ln -s $(realpath nvim-lua-config/init.lua) ~/.config/nvim/
ln -s $(realpath nvim-lua-config/lua) ~/.config/nvim/
