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
	'jbyuki/nabla.nvim',
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

	-- messages
	{
		"ariel-frischer/bmessages.nvim",
		event = "CmdlineEnter",
		opts = {}
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
	-- {
	-- 	'ggandor/leap.nvim',
	-- 	dependencies = { "tpope/vim-repeat" },
	-- 	config = function()
	-- 		require('leap').create_default_mappings()
	-- 	end,
	-- },
	-- session manager
	'tpope/vim-obsession',

	-- provides fluid scrolling
	-- 'vim-scripts/ScrollColors',
	-- 'yuttie/comfortable-motion.vim',
	{
		"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup {}
		end
	},

	-- utilities
	{ "akinsho/toggleterm.nvim" },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
	},

	-- typst
	{
		'chomosuke/typst-preview.nvim',
		dev = false,
		ft = 'typst',
		-- version = '0.1.*',
		build = function() require 'typst-preview'.update() end,
		opts = {
			open_cmd = 'firefox %s -P typst-preview --class typst-preview',
		}
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
	'mhinz/vim-sayonara',
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ "\"",    mode = { "n", "v" } },
			{ "<C-R>", mode = "i" }
		},
		cmd = "Registers",
	},
	{
		'nmac427/guess-indent.nvim',
		config = function()
			require('guess-indent').setup {}
		end
	},
	{
		"folke/zen-mode.nvim",
		opts = {
		}
	},
	-- show off
	'andweeb/presence.nvim',
},
{
	dev = {
		path = "~/src/mace/",
	},
})
