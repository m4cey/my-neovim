require("catppuccin").setup({
	flavour = require('color_overrides').flavour, -- latte, frappe, macchiato, mocha
	background = {   -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = true,   -- shows the '~' characters after the end of buffers
	term_colors = false,         -- sets terminal colors (e.g. `g:terminal_color_0`)
	styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" },  -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = require('color_overrides'),
	highlight_overrides = {
		all = function(colors)
			return {
				CmpItemMenu = { fg = colors.surface2 },
				CursorLineNr = { fg = colors.text },
				FloatBorder = { bg = colors.base, fg = colors.surface1 },
				LineNr = { fg = colors.overlay0 },
				LspInfoBorder = { link = "FloatBorder" },
				NeoTreeDirectoryIcon = { fg = colors.subtext1 },
				NeoTreeDirectoryName = { fg = colors.subtext1 },
				NeoTreeFloatBorder = { link = "FloatBorder" },
				NeoTreeGitConflict = { fg = colors.red },
				NeoTreeGitDeleted = { fg = colors.red },
				NeoTreeGitIgnored = { fg = colors.overlay0 },
				NeoTreeGitModified = { fg = colors.peach },
				NeoTreeGitStaged = { fg = colors.green },
				NeoTreeGitUnstaged = { fg = colors.red },
				NeoTreeGitUntracked = { fg = colors.green },
				NeoTreeIndent = { fg = colors.surface1 },
				NeoTreeNormal = { bg = colors.mantle },
				NeoTreeNormalNC = { bg = colors.mantle },
				NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
				NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
				NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
				NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
				NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
				NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
				NormalFloat = { bg = colors.base },
				Pmenu = { bg = colors.mantle },
				PmenuSel = { bg = colors.surface1, fg = colors.surface0 },
				VertSplit = { bg = colors.base, fg = colors.surface1 },
				YankHighlight = { bg = colors.surface2 },

				IblIndent = { fg = colors.overlay0 },
				IblScope = { fg = colors.text },

				RainbowDelimiterRed = { fg = colors.red },
				RainbowDelimiterGreen = { fg = colors.green },
				RainbowDelimiterYellow = { fg = colors.yellow },
				RainbowDelimiterCyan = { fg = colors.teal },
				RainbowDelimiterViolet = { fg = colors.pink },
				RainbowDelimiterBlue = { fg = colors.blue },

				-- Noice
				NoiceMini = { bg = colors.base },

				-- GitSings
				GitSingsAdd = { fg = colors.teal },
				TSEmphasis = { style = { "italic" } },
				["@text.emphasis"] = { link = "TSEmphasis" },
			}
		end,
		latte = function(colors)
			return {
				IblIndent = { fg = colors.mantle },
				IblScope = { fg = colors.surface1 },

				LineNr = { fg = colors.surface1 },
			}
		end,
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
		indent_blankline = {
			enabled = true,
			scope_color = "subtext0", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = true,
		},
		lightspeed = true,
		mason = true,
		neotree = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		ts_rainbow = true,
		bufferline = true,

		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

vim.cmd.colorscheme "catppuccin"
