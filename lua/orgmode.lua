local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

-- Load treesitter grammar for org
orgmode.setup_ts_grammar()

-- Setup orgmode
orgmode.setup({
	org_agenda_files = '~/orgfiles/**/*',
	org_default_notes_file = '~/orgfiles/refile.org',
	win_split_mode = 'tabnew',
	org_hide_leading_stars = true,
	org_hide_emphasis_markers = true,
	mappins = {
		global = {
			-- org_agenda = '<Leader>ra',
			-- org_capture = '<Leader>oc',
		}
	}
})
