-- local TypstWatch = function()
-- 	vim.cmd [[silent exe "!zathura --fork " . expand("%:p:r") . ".pdf &"]]
-- end
vim.keymap.set('n', '<Leader>w', ':TypstPreviewToggle<cr>', { silent = true })
vim.keymap.set('n', '<Leader>c', ':TypstPreviewSyncCursorToggle<cr>', { silent = true })

vim.opt.list = false
