-- NightFox

-- vim.cmd "colorscheme terafox"
-- require('nightfox').setup({
    --   options = {
      --     styles = {
        -- comments = "italic",
        -- strings = "NONE",
        -- keywords = "bold",
        -- functions = "bold,italic",
        -- variables = "NONE",
        -- diagnostics = "undercurl",
      --     },
      --     modules = {
        --        native_lsp = true,
        --        lightspeed = true,
        --        cmp = true,
        --        modes = true,
        --        gitsigns = true,
        --        treesitter = true,
        --        tsrainbow = true
      --     },
    --   }
  -- })

-- OneNord

vim.cmd "colorscheme onenord"
require('onenord').setup({
    borders = true,
    fade_nc = true,
    styles = {
      comments = "italic",
      strings = "NONE",
      keywords = "bold",
      functions = "bold,italic",
      variables = "NONE",
      diagnostics = "undercurl",
    },
    disable = {
      background = false, -- Disable setting the background color
      cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
