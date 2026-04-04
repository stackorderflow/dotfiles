local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = true

-- Indentation
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.smartindent    = true

-- Search
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = false
opt.incsearch      = true

-- Appearance
opt.termguicolors  = true
opt.signcolumn     = "yes"
opt.cursorline     = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.wrap           = false
opt.colorcolumn    = "100"
opt.showmode       = false   -- lualine shows the mode instead

-- Splits
opt.splitright     = true
opt.splitbelow     = true

-- Files
opt.swapfile       = false
opt.backup         = false
opt.undofile       = true
opt.undodir        = vim.fn.stdpath("data") .. "/undodir"

-- Completion
opt.completeopt    = "menu,menuone,noselect"

-- Misc
opt.mouse          = "a"
opt.clipboard      = "unnamedplus"
opt.updatetime     = 250
opt.timeoutlen     = 300
opt.isfname:append("@-@")
