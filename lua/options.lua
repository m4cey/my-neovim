local set = vim.opt
-- general settings
set.undofile = true
set.title = true
set.ruler = true
set.cursorline = true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.list = true
set.hidden = true
set.termguicolors = true
set.showmode = false
set.showcmd = false
set.swapfile = false
set.laststatus = 3
set.cmdheight = 1
set.updatetime = 300
set.background = "dark"
set.clipboard = "unnamedplus"
set.shortmess = "sc"
set.listchars = "eol:¬,tab:  ,space: ,nbsp:␣,trail:…,precedes:«,extends:»"
set.sessionoptions = "globals,folds,curdir,tabpages,buffers"
set.wildmode = "longest,list,full"
set.completeopt = "menu,menuone,noselect"
-- window/buffer settings
set.number = true
set.expandtab = false
set.tabstop = 3
set.shiftwidth = 3
set.softtabstop = 3
set.signcolumn = "number"
set.filetype = 'on'
set.syntax = 'on'
set.conceallevel = 2
