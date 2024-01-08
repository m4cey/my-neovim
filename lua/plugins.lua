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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	-- statusline
	'nvim-lualine/lualine.nvim',
	-- bufferline
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "kyazdani42/nvim-web-devicons",
		},
	},

	-- file browser
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim"
		}
	},

	-- mason
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end
	},
	-- formatter
	'sbdchd/neoformat',

	-- lspconfig
	'neovim/nvim-lspconfig',

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
	'onsails/lspkind.nvim',
	'dmitmel/cmp-digraphs',
	'chrisgrieser/cmp-nerdfont',

	-- snippets
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',

	-- motions and text objects
	'tomtom/tcomment_vim',
	'tpope/vim-surround',
	'wellle/targets.vim',
	{
		'ggandor/leap.nvim',
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require('leap').create_default_mappings()
		end,
	},
	-- session manager
	'tpope/vim-obsession',

	-- provides fluid scrolling
	'vim-scripts/ScrollColors',
	'yuttie/comfortable-motion.vim',

	-- utilities
	{ "akinsho/toggleterm.nvim" },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
	},

	-- typst
	{
	  'chomosuke/typst-preview.nvim',
	  dev = true,
	  ft = 'typst',
	  version = '0.1.*',
	  build = function() require 'typst-preview'.update() end,
	},

	-- eye candy
	'HiPhish/rainbow-delimiters.nvim',
	'lewis6991/gitsigns.nvim',
	'MrPicklePinosaur/typst-conceal.vim',
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			vim.opt.termguicolors = true
			require('colorizer').setup()
		end
	},
	-- quality of life
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ "\"",    mode = { "n", "v" } },
			{ "<C-R>", mode = "i" }
		},
		cmd = "Registers",
	},
	'mhinz/vim-sayonara',
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("gx").setup {
			open_browser_app = "handlr", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
			open_browser_args = { "open" }, -- specify any arguments, such as --background for macOS' "open".
			handlers = {
				plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
				github = true, -- open github issues
				brewfile = true, -- open Homebrew formulaes and casks
				package_json = true, -- open dependencies from package.json
				search = true, -- search the web/selection on the web if nothing else is found
			},
			handler_options = {
				search_engine = "https://duckduckgo.com/search?q=", -- or you can pass in a custom search engine
			},
		} end,
	},
	{
		'nmac427/guess-indent.nvim',
		config = function()
			require('guess-indent').setup {}
		end
	},
	-- show off
	'andweeb/presence.nvim',
},
{
	dev = {
		path = "~/src/mace/",
	},
},
{
	dev = {
		path = "~/src/mace/",
	},
})
