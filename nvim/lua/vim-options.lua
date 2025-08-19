local opt = vim.opt

opt.compatible = false                       -- equivalent to :set nocompatible
opt.clipboard = "unnamed"                    -- set clipboard=unnamed
opt.errorbells = false                       -- set noerrorbells
opt.belloff = "all"                          -- set belloff=all
opt.mouse = "a"                              -- set mouse=a
opt.tabstop = 2                              -- set tabstop=4
opt.softtabstop = 2                          -- set softtabstop=4
opt.shiftwidth = 2                           -- set shiftwidth=4
opt.expandtab = true                         -- set expandtab
opt.smartindent = true                       -- set smartindent
opt.number = true                            -- set nu
opt.wrap = false                             -- set nowrap
opt.smartcase = true                         -- set smartcase
opt.backspace = { "indent", "eol", "start" } -- set backspace=indent,eol,start
opt.undofile = true                          -- set undofile
opt.incsearch = true                         -- set incsearch
opt.relativenumber = true                    -- set relativenumber
opt.ignorecase = true
opt.swapfile = false
