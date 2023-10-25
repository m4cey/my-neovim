vim.cmd "colorscheme lushwal"

-- Lushwal
vim.g.lushwal_configuration = {
	compile_to_vimscript = true,
	color_overrides = nil,
	addons = {
		gitsigns_nvim = true,
		lightspeed_nvim = true,
		native_lsp = true,
		nerdtree = true,
		lualine = true,
		nvim_cmp = true,
		nvim_ts_rainbow = true,
		treesitter = true,
	}
}
