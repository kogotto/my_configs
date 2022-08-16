
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
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kris2k/a.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" some sweets
set number
set relativenumber

" highlite line/column only in current window
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorcolumn

" Save current session on every file save in current dirrectory in file
" Session.vim
autocmd BufWritePost * : mksession!

syntax on
imap jj <Esc>
imap jJ <Esc>
imap Jj <Esc>
imap JJ <Esc>
set path+=**

set autoread
autocmd CursorHold * checktime

" Just highlight word under cursor, do not jump to next
nnoremap * *N
nnoremap # #N

nnoremap n nzz
nnoremap N Nzz

" tab switch
nnoremap <C-F1> 1gt
nnoremap <C-F2> 2gt
nnoremap <C-F3> 3gt
nnoremap <C-F4> 4gt
nnoremap <C-F5> 5gt
nnoremap <C-F6> 6gt
nnoremap <C-F7> 7gt
nnoremap <C-F8> 8gt
nnoremap <C-F9> 9gt

nnoremap <C-w>t :tabnew<CR>

" clone current window in new tab
nnoremap <C-w>n <C-w>v<C-w>T

" Find symbol under cursor in new window
nmap <C-w><F12> <C-w>v<C-w><C-w><F12>

" alternate files switch
nnoremap <F2> :AV<CR>      " vertical split and switch
nnoremap <F3> :AT<CR>      " new tab and switch
nnoremap <F4> :A<CR>       " just switch

" tabs and intendation
set tabstop=4              " visualise tab as %tabstop% spaces
set softtabstop=4          " insert % spaces when you hit tab
set shiftwidth=4           "
set expandtab              " make tab just a shortcut for inserting spaces
set smartindent            "

" search
set hlsearch
set incsearch
set ignorecase

" show tabs and unwanted spaces
set listchars=tab:>-,trail:-   "show tabs as >--- and trailing spaces as -
set list                       "show this

" nerd tree
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=80
"    this is for mac
nnoremap ø : NERDTreeToggle <CR>
nnoremap ∆ : NERDTreeFind <CR>
"    this is for linux/windows and others who have 'Alt' key
nnoremap <M-o> : NERDTreeToggle <CR>
nnoremap <M-j> : NERDTreeFind <CR>

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
