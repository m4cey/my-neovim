local map = vim.api.nvim_set_keymap
local set = vim.opt

local TypstWatch = function()
	vim.cmd [[silent exe "!zathura --fork " . expand("%:p:r") . ".pdf &"]]
end
vim.keymap.set('n', '<Leader>w', TypstWatch, { silent = true })

set.list = false
