require 'nvim-treesitter.configs'.setup {
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { 'vim', 'lua', 'go', 'bash', 'html', 'css', 'markdown', 'markdown_inline', 'regex' },

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- List of parsers to ignore installing
	-- ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false
	},

	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- 	max_file_lines = nil
	-- }
}
local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

parser_config.typst = {
	install_info = {
		url = 'https://github.com/uben0/tree-sitter-typst',
		files = { 'src/parser.c', 'src/scanner.c' },
		-- requires_generate_from_grammar = false,
	},
	filetype = 'typ',
}
