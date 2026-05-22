require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("solargraph", {
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
      completion = true,
      useBundler = true,
    },
  },
})

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
  -- "ruby_lsp",
  "solargraph",
  -- "tsgo"
}
vim.lsp.enable(servers)
