function map(mode, shortcut, command, args)
  vim.api.nvim_set_keymap(mode, shortcut, command, args)
end

function imap(shortcut, command)
  map('i', shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command, { noremap = true, silent = true })
end

function vmap(shortcut, command)
  map('v', shortcut, command, { noremap = true, silent = true })
end

-- alternate Esc and write
imap("<C-c>", "<Esc>")
nmap("<C-s>", ":w<CR>")

-- disabled search highlighting
nmap("<C-c>", ":noh<CR>")

-- move between splits
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")

-- move between buffers
nmap("<Tab>", ":bnext<CR>")
nmap("<S-Tab>", ":bprev<CR>")


-- menu nav with ctl-j and ctl-k
vim.cmd[[inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"]]
vim.cmd[[inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"]]
vim.cmd[[cmap <expr> <C-j> luaeval('require"cmp".visible()') ? "\<C-n>" : "\<C-j>"]]
vim.cmd[[cmap <expr> <C-k> luaeval('require"cmp".visible()') ? "\<C-p>" : "\<C-k>"]]


-- toggle comment
nmap("<C-_>", ":CommentToggle<CR>")
vmap("<C-_>", ":CommentToggle<CR>")

-- leader
vim.cmd[[let mapleader = " "]]
