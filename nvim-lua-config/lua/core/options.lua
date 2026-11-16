-- Kogo options

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Persistent undo history
opt.undofile = true

-- Tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true
opt.scrolloff = 8

-- Appearance
opt.termguicolors = true
opt.updatetime = 250
opt.background = "dark"
opt.signcolumn = "yes"
opt.listchars = "tab:>-,trail:-" -- show tabs as >--- and trailing spaces as -
opt.list = true
opt.colorcolumn = "80"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

opt.jumpoptions = 'view' -- Keep window view on jumps
opt.pumheight = 12 -- Maximum number of items to show in the popup menu
opt.showmode = false -- Do not show mode in command line since we have a statusline
opt.cmdheight = 1

-- Files
opt.swapfile = false -- Disable swap files since we have undo files and auto-session
opt.autoread = true -- Automatically read files when changed outside of vim
