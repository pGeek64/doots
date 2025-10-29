require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})
vim.lsp.enable("pyright")

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = { disableSuggestions = true },
  },
})
vim.lsp.enable("ts_ls")

for _, lsp in ipairs({ "html", "cssls" }) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("qmlls", {
  cmd = { "qmlls6" }, -- must be in PATH
  filetypes = { "qml", "qmljs" },
  root_dir = function(fname)
    local git_root = vim.fs.find(".git", { path = fname, upward = true })[1]
    return git_root and vim.fs.dirname(git_root) or vim.loop.cwd()
  end,
  single_file_support = true,
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
})
vim.lsp.enable("qmlls")
