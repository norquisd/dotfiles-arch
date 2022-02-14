-- globals
HOME = os.getenv("HOME")

-- base settings
vim.o.wrap = false
vim.o.nu = true
vim.o.relativenumber = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.errorbells = false
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.timeoutlen = 100 
vim.o.laststatus = 0
vim.o.mouse = "a"
vim.o.signcolumn = "yes"
vim.cmd [[set completeopt=menuone,noinsert,noselect]]
vim.o.showmode = false
vim.o.updatetime = 300
vim.o.cursorline = true
vim.o.ignorecase = true


-- persistent undo
vim.o.undodir = HOME .. "/.config/nvim/undodir"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- colorscheme
vim.g.material_style = "darker"
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1
vim.cmd[[colorscheme material]]

