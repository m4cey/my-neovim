require 'typst-preview'.setup {
	debug = false,
	open_cmd = 'firefox -P typst-preview --class typst-preview http://%s',
	set_follow_cursor = false,
	get_root = function()--bufnr_of_typst_buffer)
		return vim.fn.getcwd()
	end,
}

local registers = require 'registers'
registers.setup {
	-- Show a line at the bottom with registers that aren't filled
	show_empty = false,
	-- Expose the :Registers user command
	register_user_command = true,
	-- Always transfer all selected registers to the system clipboard
	system_clipboard = true,
	-- Don't show whitespace at the begin and end of the register's content
	trim_whitespace = true,
	-- Don't show registers which are exclusively filled with whitespace
	hide_only_whitespace = true,
	-- Show a character next to the register name indicating how the register will be applied
	show_register_types = true,
	bind_keys = {
		-- Show the window when pressing " in normal mode, applying the selected register as part of a motion, which is the default behavior of Neovim
		normal    = registers.show_window({ mode = "motion" }),
		-- Show the window when pressing " in visual mode, applying the selected register as part of a motion, which is the default behavior of Neovim
		visual    = registers.show_window({ mode = "motion" }),
		-- Show the window when pressing <C-R> in insert mode, inserting the selected register, which is the default behavior of Neovim
		insert    = registers.show_window({ mode = "insert" }),

		-- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
		registers = registers.apply_register({ delay = 0.1 }),
		-- Immediately apply the selected register line when pressing the return key
		["<CR>"]  = registers.apply_register(),
		-- Close the registers window when pressing the Esc key
		["<Esc>"] = registers.close_window(),

		-- Move the cursor in the registers window down when pressing <C-n>
		["<C-n>"] = registers.move_cursor_down(),
		-- Move the cursor in the registers window up when pressing <C-p>
		["<C-p>"] = registers.move_cursor_up(),
		-- Move the cursor in the registers window down when pressing <C-j>
		["<C-j>"] = registers.move_cursor_down(),
		-- Move the cursor in the registers window up when pressing <C-k>
		["<C-k>"] = registers.move_cursor_up(),
		-- Clear the register of the highlighted line when pressing <DeL>
		["<Del>"] = registers.clear_highlighted_register(),
		-- Clear the register of the highlighted line when pressing <BS>
		["<BS>"]  = registers.clear_highlighted_register(),
	},
	events = {
		-- When a register line is highlighted, show a preview in the main buffer with how the register will be applied, but only if the register will be inserted or pasted
		on_register_highlighted = registers.preview_highlighted_register({ if_mode = { "insert", "paste" } }),
	},
	symbols = {
		-- Show a special character for line breaks
		newline = "¬",
		-- Show space characters without changes
		space = " ",
		-- Show a special character for tabs
		tab = "·",
		-- The character to show when a register will be applied in a char-wise fashion
		register_type_charwise = "C",
		-- The character to show when a register will be applied in a line-wise fashion
		register_type_linewise = "L",
		-- The character to show when a register will be applied in a block-wise fashion
		register_type_blockwise = "B",
	},
	window = {
		max_width = 50,
		highlight_cursorline = false,
		border = "single",
		transparency = 0,
	},
	-- Highlight the sign registers as regular Neovim highlights
	sign_highlights = {
		cursorlinesign = "CursorLine",
		signcolumn = "SignColumn",
		cursorline = "Visual",
		selection = "Constant",
		default = "Function",
		unnamed = "Statement",
		read_only = "Type",
		expression = "Exception",
		black_hole = "Error",
		alternate_buffer = "Operator",
		last_search = "Tag",
		delete = "Special",
		yank = "Delimiter",
		history = "Number",
		named = "Todo",
	},
}

local rainbow_delimiters = require 'rainbow-delimiters'

require "rainbow-delimiters.setup".setup {
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		vim = rainbow_delimiters.strategy['local'],
	},
	query = {
		[''] = 'rainbow-delimiters',
		lua = 'rainbow-blocks',
	},
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterGreen',
		'RainbowDelimiterYellow',
		'RainbowDelimiterBlue',
		'RainbowDelimiterViolet',
		'RainbowDelimiterCyan',
	},
}

require("ibl").setup {
	indent = {
		tab_char = '▏',
		highlight = vim.g.rainbow_delimiters.highlight
	},
	scope = { enabled = true }
}
-- tab_char:
-- • left aligned solid
--   • `▏`
--   • `▎` (default)
--   • `▍`
--   • `▌`
--   • `▋`
--   • `▊`
--   • `▉`
--   • `█`
-- • center aligned solid
--   • `│`
--   • `┃`
-- • right aligned solid
--   • `▕`
--   • `▐`
-- • center aligned dashed
--   • `╎`
--   • `╏`
--   • `┆`
--   • `┇`
--   • `┊`
--   • `┋`
-- • center aligned double
--   • `║`
