-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
	{ text = "E ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
	{ text = "W ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
	{ text = "I ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
	{ text = "H", texthl = "DiagnosticSignHint" })
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"

require("neo-tree").setup({
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		-- "document_symbols"
	},
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "single",
	enable_git_status = true,
	enable_diagnostics = true,
	default_component_configs = {
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		modified = {
			symbol = "",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted   = "D", -- this can only be used in the git_status source
				renamed   = "R", -- this can only be used in the git_status source
				-- Status type
				untracked = "?",
				unmerged  = "U",
				ignored   = "I",
				unstaged  = "M",
				staged    = "S",
				conflict  = "C",
			}
		},
	},
	window = {
		position = "right",
		width = 40,
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["<cr>"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["C"] = "close_node",
			["<bs>"] = "navigate_up",
			["."] = "set_root",
			["H"] = "toggle_hidden",
			["R"] = "refresh",
			["/"] = "fuzzy_finder",
			["f"] = "filter_on_submit",
			["<c-x>"] = "clear_filter",
			["a"] = "add",
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination
			["m"] = "move", -- takes text input for destination
			["q"] = "close_window",
		}
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_by_name = {
				".DS_Store",
				"thumbs.db"
				--"node_modules"
			},
			never_show = { -- remains hidden even if visible is toggled to true
				--".DS_Store",
				--"thumbs.db"
			},
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		-- time the current file is changed while the tree is open.
		hijack_netrw_behavior = "open_default",
		-- "open_default", netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
		-- instead of relying on nvim autocmd events.
	},
	buffers = {
		show_unloaded = true,
		window = {
			position = "float",
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["o"] = {
					"show_help",
					nowait = false,
					config = { title = "Order by", prefix_key = "o" }
				},
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			}
		},
	},
	git_status = {
		window = {
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
				["o"]  = {
					"show_help",
					nowait = false,
					config = { title = "Order by", prefix_key = "o" }
				},
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			}
		}
	},
	document_symbols = {
		follow_cursor = true,
		window = {
			mappings = {
				["o"] = "jump_to_symbol",
				["r"] = "rename",
				["P"] = "preview",
				["s"] = "split",
			},
		},
	},
	source_selector = {
		winbar = false,
		statusline = false,
		content_layout = "center",
		-- tabs_layout = "active",
		sources = {
			{
				source = "filesystem", -- string
				display_name = "Files" -- string | nil
			},
			-- {
			-- 	source = "buffers", -- string
			-- 	display_name = "Buffers" -- string | nil
			-- },
			{
				source = "git_status", -- string
				display_name = "Git" -- string | nil
			},
			-- {
			-- 	source = "document_symbols", -- string
			-- 	display_name = "Symbols" -- string | nil
			-- },
		}
	}
})
vim.cmd([[nnoremap \\ :Neotree toggle reveal<cr>]])
vim.cmd([[nnoremap \b :Neotree toggle buffers reveal<cr>]])
vim.cmd([[nnoremap \g :Neotree toggle git_status reveal<cr>]])
