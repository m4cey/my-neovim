local stats_ok, _ = pcall(require, "lspconfig")
if not stats_ok then
  return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()

