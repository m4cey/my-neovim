require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "bold",
    },
    modules = {
       native_lsp = true,
       lightspeed = true,
       cmp = true,
       modes = true,
       gitsigns = true,
       treesitter = true,
       tsrainbow = true
    },
  }
})
vim.cmd "colorscheme terafox"
