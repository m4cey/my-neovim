-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Disables automatic commenting on newline
-- vim.cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
-- Save file as sudo on files that require root permission
vim.cmd "command -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod"
-- CD to current file directory
vim.cmd "command -bar CD exe 'cd %:p:h'"

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd [[
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
]]

-- When shortcut files are updated, renew configs with new material:
vim.cmd "autocmd BufWritePost bm-files,bm-dirs !shortcuts"
-- Colorizer
vim.cmd "autocmd BufWritePost * :ColorizerAttachToBuffer"
