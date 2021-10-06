-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
vim.opt["relativenumber"] = true
-- vim.g.sonokai_style = "shusia"

vim.g.material_theme_style = "darker"
-- vim.g.gruvbox_material_background = "soft"
lvim.colorscheme = "material"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-_>"] = ":CommentToggle<CR>"
lvim.keys.visual_mode["<C-_>"] = ":CommentToggle<CR>"

lvim.keys.normal_mode["<Tab>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferPrevious<CR>"

-- Some completion keybindings
-- lvim.builtin.compe.keymap.values.insert_mode["<C-l>"] = { "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { silent = true, noremap = true, expr = true } }
-- lvim.builtin.compe.keymap.values.insert_mode["<C-h>"] = { "compe#close()", { silent = true, noremap = true, expr = true } }
-- lvim.builtin.compe.preselect = "always"


local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  }
}

lvim.builtin.cmp.mapping["<C-l>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
}

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction='horizontal'
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

lvim.builtin.dap.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  {"folke/tokyonight.nvim"},
  {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "InsertEnter"
  },
  {"kaicataldo/material.vim"},
  {"sainnhe/edge"},
  {"sainnhe/everforest"},
  {"sainnhe/sonokai"},
  {"sainnhe/gruvbox-material"},
  {"joshdick/onedark.vim"},
  {"soft-aesthetic/soft-era-vim"},
  {"arcticicestudio/nord-vim"},
  -- {
  --   "lervag/vimtex"
  --   setup = function()
  --     -- vim.g.vimtex_compiler_progname = 'nvr'
  --     vim.g.tex_flavor = 'latex'
  --     -- vim.g.vimtex_view_method = 'zathura'
  --     -- vim.g.vimtex_quickfix_mode = 0
  --     -- vim.o.conceallevel=1
  --     -- vim.g.tex_conceal = 'abdmg'
  --   end
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {"DarwinSenior/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup(_, {
        RGB = false,
        RRGGBB = true,
        RRGGBBAA = true,
        css_fn = true,
        names = true,
        mode = "virtualtext",
        virtualtext = "■",
      })
    end
  },
  {"aca/emmet-ls", 
    config = function()
      lvim.lang.emmet.active = true
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
