-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

packer.init {
   display = {
      open_fn = function()
	 return require("packer.util").float {border = "shadow"}
      end,
   },
}

packer.startup(function(use)
   use 'wbthomason/packer.nvim'
   -- colorscheme
   use 'EdenEast/nightfox.nvim'
   use 'rmehri01/onenord.nvim'
   -- statusline
   use 'nvim-lualine/lualine.nvim'
   -- bufferline
   use 'noib3/nvim-cokeline'
   -- file browser
   use {'nvim-neo-tree/neo-tree.nvim', requires = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim"
   }}
   -- lsp
   use 'neovim/nvim-lspconfig'
   use 'williamboman/nvim-lsp-installer'
   -- tree-sitter
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }
   -- autocomplete
   use 'hrsh7th/cmp-nvim-lua'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'saadparwaiz1/cmp_luasnip'
   use 'hrsh7th/nvim-cmp'
   -- JSON schemas
   use 'b0o/schemastore.nvim'
   -- snippets
   use 'L3MON4D3/LuaSnip'
   use 'rafamadriz/friendly-snippets'
   -- motions and text objects
   use 'tomtom/tcomment_vim'
   use 'tpope/vim-surround'
   use 'ggandor/lightspeed.nvim'
   use 'wellle/targets.vim'
   -- session manager
   use 'tpope/vim-obsession'
   -- provides fluid scrolling
   use 'vim-scripts/ScrollColors'
   use 'yuttie/comfortable-motion.vim'
   -- utilities
   use 'sheerun/vim-polyglot'
   use {"akinsho/toggleterm.nvim"}
   use 'mattn/emmet-vim'
   -- eye candy
   use 'kyazdani42/nvim-web-devicons'
   use 'p00f/nvim-ts-rainbow'
   use 'lewis6991/gitsigns.nvim'
   use {
      "mvllow/modes.nvim", config = function ()
         vim.opt.cursorline = true
         require('modes').setup()
      end
   }
   -- use {'rrethy/vim-hexokinase', { run = 'make hexokinase' }}
   -- show off
   use 'andweeb/presence.nvim'
end)

-- Auto-compile plugins when plugins.lua is saved
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
