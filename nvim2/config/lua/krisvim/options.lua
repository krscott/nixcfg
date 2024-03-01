
local opt = vim.opt

opt.termguicolors = true

-- Indents
opt.autoindent = true
opt.expandtab = true  -- Use spaces instead of tabs
opt.shiftround = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.incsearch = true -- Find the next match as we type
opt.hlsearch = true -- Highlight searches
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless we type a capital

