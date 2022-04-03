local map = vim.api.nvim_set_keymap

-- space as leader key
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Perform dot commands over visual blocks:
map("v", ".", ":normal .<CR>", {noremap = true})

-- buffers
map('n', '<S-j>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
map('n', '<S-k>',     '<Plug>(cokeline-focus-next)',  { silent = true })
map('n', '<S-Tab>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
map('n', '<Tab>',     '<Plug>(cokeline-focus-next)',  { silent = true })
map('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
map('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })
map('n', '<Leader>s', '<Plug>(cokeline-pick-focus)', { silent = true })
map('n', '<Leader>S', '<Plug>(cokeline-pick-close)', { silent = true })
map('n', '<Leader>c', ':bd<CR>', { silent = true })

for i = 1,9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end
