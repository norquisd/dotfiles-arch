require('packer').startup(function()

	use "wbthomason/packer.nvim"

	use "marko-cerovac/material.nvim"

	use "glepnir/dashboard-nvim"

	use {
		"nvim-telescope/telescope.nvim",
		requires = {{"nvim-lua/plenary.nvim"}},
		config = function() require('telescope').setup{
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = require('telescope.actions').move_selection_next,
						["<C-k>"] = require('telescope.actions').move_selection_previous,
					}
				}
			}
		}
	end
	}

	use "terrortylor/nvim-comment"
	require("nvim_comment").setup()

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use {
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
	}

	use {
		"SirVer/ultisnips"
	}

	use {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"quangnguyen30192/cmp-nvim-ultisnips"
	}

	use {
		"simrat39/rust-tools.nvim"
	}
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				auto_preview = false
			}
		end
	}

	use {
		"nvim-lualine/lualine.nvim",
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}

	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function() require'nvim-tree'.setup {} end
	}

	use {"folke/which-key.nvim"}
	use {
		"ray-x/lsp_signature.nvim",
		config = function() require'lsp_signature'.setup() end
	}

	use {
		"akinsho/toggleterm.nvim",
		config = function() require'toggleterm'.setup({
			open_mapping = [[<C-t>]],
			direction = 'float',
			shade_terminals = false,
			float_opts = {
				border = 'curved',
			}
		}) end

	}

end)
