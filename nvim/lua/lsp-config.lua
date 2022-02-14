local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"clangd",
	"html",
	"pyright",
	"texlab",
	"sumneko_lua",
	"rust_analyzer",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- LSP settings (for overriding per client)

-- Hover window
vim.cmd [[autocmd CursorHold,CursorHoldI * lua if (vim.fn.pumvisible() == 0 and require"cmp".visible() == false)  then vim.diagnostic.open_float(nil, {focus=false, scope="cursor"}) end]]
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua if (vim.fn.pumvisible() == 0 and require"cmp".visible() == false)  then vim.lsp.buf.hover() end]]
vim.cmd [[nmap <silent> <C-h> :lua vim.diagnostic.open_float(nil, {focus=false})<CR>]]

vim.diagnostic.config({
	virtual_text = false
})

-- add floating window border
local border = {
	{"🭽", "FloatBorder"},
	{"▔", "FloatBorder"},
	{"🭾", "FloatBorder"},
	{"▕", "FloatBorder"},
	{"🭿", "FloatBorder"},
	{"▁", "FloatBorder"},
	{"🭼", "FloatBorder"},
	{"▏", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

lsp_installer.on_server_ready(function(server)
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local opts = {capabilities = capabilities}
	if server.name == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", {
			settings = {
				Lua = {
					runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
					diagnostics = {globals = {'vim'}},
					workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
					telemetry = {enable = false}
				}
			}

		}, opts)
		server:setup(opts)
	elseif server.name == "rust_analyzer" then
		require("rust-tools").setup {
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		}
		server:attach_buffers()
	else
		server:setup(opts)
	end
end)
