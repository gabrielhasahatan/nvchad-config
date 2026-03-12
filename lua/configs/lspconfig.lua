require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  -- "gopls",
  "tailwindcss",
  "rust_analyzer",
  "lua_ls",
  "dartls",
  "clangd",
  "ruby_lsp",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- Optional: konfigurasi tambahan khusus untuk gopls
-- local lspconfig = require "lspconfig"
--
-- lspconfig.gopls.setup {
--   settings = {
--     gopls = {
--       gofumpt = true,
--       staticcheck = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }
