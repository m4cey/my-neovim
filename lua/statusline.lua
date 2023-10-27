require('lualine').setup {
   options = {
      icons_enabled = false,
      theme = 'lushwal',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
      styles = {
	 comments = "italic",
	 keywords = "bold",
	 types = "italic,bold",
      },
   },
   sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {{'filename', path = 1, symbols = { modified = ' ', readonly = ' '}}},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress', '%{ObsessionStatus()}'},
      lualine_z = {'location'}
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
   },
   tabline = {},
   extensions = {}
}
