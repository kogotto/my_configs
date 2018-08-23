
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/youcompleteme'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" some sweets
set number
set relativenumber
syntax on
imap jj <Esc>
set path+=**

" tabs and intendation
set tabstop=2              " visualise tab as %tabstop% spaces
set softtabstop=2          " insert % spaces when you hit tab
set shiftwidth=2           "
set expandtab              " make tab just a shortcut for inserting spaces
set smartindent            "

" search
set hlsearch
set incsearch

" show tabs and unwanted spaces
set listchars=tab:>-,trail:-   "show tabs as >--- and trailing spaces as -
set list                       "show this

" nerd tree
let g:NERDTreeWinPos="right"
nnoremap ø : NERDTreeToggle <CR>

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" pretty colors, gruvbox-dark is fucking awesome
colorscheme gruvbox
set background=dark

set colorcolumn=79

" YCM settings
let g:ycm_confirm_extra_conf = 0
" YCM aliases
nnoremap <F12> : YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :  YcmForceCompileAndDiagnostics<CR><CR>
nnoremap <F11> : YcmCompleter FixIt<CR>
