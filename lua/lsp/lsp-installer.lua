local stats_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not stats_ok then
  return
end

lsp_installer.on_server_ready(function(server)
   local opts = {
      on_attach = require("lsp.handlers").on_attach,
      capabilities = require("lsp.handlers").capabilities,
   }
   local has_options, my_opts = pcall(require, "lsp.options." .. server.name)
   if has_options then
      opts = vim.tbl_deep_extend("force", my_opts, opts)
   end
   server:setup(opts)
end)
