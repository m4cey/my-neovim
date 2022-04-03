local my_schemas = require('schemastore').json.schemas {
   -- select = {},
   -- ignore = {}
}

local opts = {
   settings = {
      json = {
	 schemas = my_schemas
      },
   },
   setup = {
      commands = {
	 Format = {
	    function()
	       vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
	    end,
	 },
      },
   },
}

return opts
