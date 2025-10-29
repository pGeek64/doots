-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- servers with default config
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

-- qmlls example
vim.lsp.config("qmlls", {
  cmd = { "qmlls6" }, -- must be in PATH
  filetypes = { "qml", "qmljs" },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  end,
  single_file_support = true,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable("qmlls")

-- example for typescript
-- vim.lsp.config("tsserver", {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })
-- vim.lsp.enable("tsserver")
