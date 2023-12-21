local stats_ok, lspconfig = pcall(require, "lspconfig")
if not stats_ok then
	return
end

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.keymap.set('n', '<C-Leader>', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<Leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))
		end, opts)
		vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<Leader>f', function()
		-- 	vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

-- Language Servers

lspconfig.lua_ls.setup {
	on_init = function(client)
		local path = client.workLeader_folders[1].name
		if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					diagnostics = {
						globals = 'vim',
					},
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workLeader = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				}
			})

			client.notify("workLeader/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}

lspconfig.typst_lsp.setup {
	settings = {
		exportPdf = "onType"
	}
}

lspconfig.clangd.setup {}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.eslint.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  capabilities = capabilities,
}
lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.bashls.setup{}
