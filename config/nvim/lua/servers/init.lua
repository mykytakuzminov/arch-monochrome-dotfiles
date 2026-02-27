local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)

require("servers.efm-langserver")(capabilities)

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'bashls',
  'clangd',
})
