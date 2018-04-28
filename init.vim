
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/youcompleteme'

Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" some sweets
set number
syntax on

" tabs and intendation
set tabstop=2              " visualise tab as %tabstop% spaces
set softtabstop=2          " insert % spaces when you hit tab
set expandtab              " make tab just a shortcut for inserting spaces

" show tabs and unwanted spaces
set listchars=tab:>-,trail:-   "show tabs as >--- and trailing spaces as -
set list                       "show this

" pretty colors, gruvbox-dark is fucking awesome
colorscheme gruvbox
set background=dark
