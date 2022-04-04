require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float'
  close_on_exit = false,
  shell = vim.o.shell,
  float_opts = {
    border = 'shadow',
    width = 120,
    height = 30,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
