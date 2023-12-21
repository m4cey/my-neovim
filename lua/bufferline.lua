local get_hex = require('cokeline.hlgroups').get_hl_attr
local mappings = require('cokeline/mappings')

local comments_fg = get_hex('Comment', 'fg')
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3
local green = vim.g.terminal_color_2

local components = {
	space = {
		text = ' ',
		truncation = { priority = 1 }
	},

	two_spaces = {
		text = '  ',
		truncation = { priority = 1 },
	},

	separator = {
		text = function(buffer)
			return buffer.index ~= 1 and '▏' or ''
		end,
		truncation = { priority = 1 }
	},

	devicon = {
		text = function(buffer)
			return
				 (mappings.is_picking_focus() or mappings.is_picking_close())
				 and buffer.pick_letter .. ' '
				 or buffer.devicon.icon
		end,
		fg = function(buffer)
			return
				 (mappings.is_picking_focus() and yellow)
				 or (mappings.is_picking_close() and red)
				 or buffer.devicon.color
		end,
		style = function(_)
			return
				 (mappings.is_picking_focus() or mappings.is_picking_close())
				 and 'italic,bold'
				 or nil
		end,
		truncation = { priority = 1 }
	},

	index = {
		text = function(buffer)
			return buffer.index .. ': '
		end,
		truncation = { priority = 1 }
	},

	unique_prefix = {
		text = function(buffer)
			return buffer.unique_prefix
		end,
		fg = comments_fg,
		style = 'italic',
		truncation = {
			priority = 3,
			direction = 'left',
		},
	},

	filename = {
		text = function(buffer)
			return buffer.filename
		end,
		style = function(buffer)
			return
				 ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
					 and 'bold,underline')
				 or (buffer.is_focused and 'bold')
				 or (buffer.diagnostics.errors ~= 0 and 'underline')
				 or nil
		end,
		truncation = {
			priority = 2,
			direction = 'left',
		},
	},

	diagnostics = {
		text = function(buffer)
			return
				 (buffer.diagnostics.errors ~= 0 and ' E ' .. buffer.diagnostics.errors)
				 or (buffer.diagnostics.warnings ~= 0 and ' W ' .. buffer.diagnostics.warnings)
				 or ''
		end,
		fg = function(buffer)
			return
				 (buffer.diagnostics.errors ~= 0 and errors_fg)
				 or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
				 or nil
		end,
		truncation = { priority = 1 },
	},

	unsaved = {
		text = function(buffer)
			return buffer.is_modified and '' or ''
		end,
		fg = function(buffer)
			return buffer.is_modified and green or nil
		end,
		truncation = { priority = 1 },
	},
}

require('cokeline').setup({
	show_if_buffers_are_at_least = 1,

	buffers = {
		-- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
		-- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
		new_buffers_position = 'next',
	},

	rendering = {
		max_buffer_width = 30,
	},
	--
	-- default_hl = {
	-- 	fg = function(buffer)
	-- 		return
	-- 		    buffer.is_focused
	-- 		    and get_hex('Normal', 'fg')
	-- 		    or get_hex('ColorColumn', 'fg')
	-- 	end,
	-- 	bg = function(buffer)
	-- 		return
	-- 		    buffer.is_focused
	-- 		    and get_hex('Normal', 'bg')
	-- 		    or get_hex('ColorColumn', 'bg')
	-- 	end,
	-- },
	default_hl = {
		-- default: `ColorColumn`'s background color for focused buffers,
		-- `Normal`'s foreground color for unfocused ones.
		fg = function(buffer)
			local hlgroups = require("cokeline.hlgroups")
			return buffer.is_focused and hlgroups.get_hl_attr("ColorColumn", "bg")
				 or hlgroups.get_hl_attr("Normal", "fg")
		end,

		-- default: `Normal`'s foreground color for focused buffers,
		-- `ColorColumn`'s background color for unfocused ones.
		-- default: `Normal`'s foreground color.
		bg = function(buffer)
			local hlgroups = require("cokeline.hlgroups")
			return buffer.is_focused and hlgroups.get_hl_attr("Normal", "fg")
				 or hlgroups.get_hl_attr("ColorColumn", "bg")
		end,
	},
	fill_hl = 'TabLineFill',

	components = {
		components.space,
		components.separator,
		components.space,
		-- components.devicon,
		components.space,
		components.index,
		components.unique_prefix,
		components.filename,
		components.diagnostics,
		components.two_spaces,
		components.unsaved,
		components.space,
	},

	sidebar = {
		filetype = { "neo-tree" },
		components = {},
	},
})
