require"lualine".setup({
	options = {
		theme = "material-nvim",
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {'dashboard'}
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = { 'filename'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = {
			{ 'progress', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
})
