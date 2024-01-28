---@diagnostic disable: undefined-global
-- local TypstWatch = function()
-- 	vim.cmd [[silent exe "!zathura --fork " . expand("%:p:r") . ".pdf &"]]
-- end
vim.keymap.set('n', '<Leader>w', ':TypstPreviewToggle<cr>', { silent = true })
vim.keymap.set('n', '<Leader>c', ':TypstPreviewFollowCursorToggle<cr>', { silent = true })

vim.opt.list = false
