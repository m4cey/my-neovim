local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- colorscheme
	-- 'EdenEast/nightfox.nvim',
	-- 'rmehri01/onenord.nvim',
	{
		"oncomouse/lushwal.nvim",
		cmd = { "LushwalCompile" },
		dependencies = {
			{ "rktjmp/lush.nvim" },
			{ "rktjmp/shipwright.nvim" },
		},
	},
	-- statusline
	'nvim-lualine/lualine.nvim',
	-- bufferline
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
			"kyazdani42/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim"       -- Optional, for persistent history
		},
		config = true
	},
	-- file browser
	{'nvim-neo-tree/neo-tree.nvim', dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim"
	}},
	-- lsp
	'neovim/nvim-lspconfig',
	-- mason
	{
	'williamboman/mason.nvim', config = function ()
			require("mason").setup()
		end
	},
	-- tree-sitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	-- autocomplete
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/nvim-cmp',
	-- JSON schemas
	'b0o/schemastore.nvim',
	-- snippets
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	-- motions and text objects
	'tomtom/tcomment_vim',
	'tpope/vim-surround',
	'ggandor/lightspeed.nvim',
	'wellle/targets.vim',
	-- session manager
	'tpope/vim-obsession',
	-- provides fluid scrolling
	'vim-scripts/ScrollColors',
	'yuttie/comfortable-motion.vim',
	-- utilities
	-- 'sheerun/vim-polyglot',
	{"akinsho/toggleterm.nvim"},
	-- 'mattn/emmet-vim',
	-- eye candy
	'kyazdani42/nvim-web-devicons',
	'p00f/nvim-ts-rainbow',
	'lewis6991/gitsigns.nvim',
	{
		"mvllow/modes.nvim", config = function ()
			vim.opt.cursorline = true
			require('modes').setup()
		end
	},
	-- use {'rrethy/vim-hexokinase', { run = 'make hexokinase' }}
	-- show off
	-- 'andweeb/presence.nvim',
})
