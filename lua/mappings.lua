require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>pc", "<cmd> !pnpm tsc --noEmit <cr>", { desc = "Typescript Check" })
map("n", "<leader>lr", "<cmd> LspRestart <cr>", { desc = "Restart LSP" })
map("n", "<leader>cr", "<cmd> Cppath <cr>", { desc = "Copy File Relative Path" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>wv", ":vsp<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
})
map("n", "<leader>rz", "<cmd> !rails zeitwerk:check <cr>", { desc = "Check Rails Zeitwerk" })
map(
  "n",
  "<leader>rr",
  "<cmd> !bundle exec annotate --models --exclude tests,fixtures,factories,serializers <cr>",
  { desc = "Generate Model Schema" }
)
map(
  "n",
  "<leader>rf",
  "<cmd> !bundle exec annotate --models %:p <cr>",
  { desc = "Generate File Model Schema" }
)
map("n", "gp", "<cmd> lua require('goto-preview').goto_preview_definition() <cr>", { desc = "Typescript Check" })
map("n", "fr", "<cmd> lua require('spectre').toggle() <cr>", { desc = "Typescript Check" })
map("n", "fc", "<cmd> lua require('spectre').open_visual({select_word=true}) <cr>", { desc = "Find Current Word" })
map("n", "ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", { desc = "Code Action" })
map("n", "<leader>rt", "<cmd> OverseerRun <cr>", { desc = "Run Task" })
map("n", "<leader>rl", "<cmd> OverseerToggle <cr>", { desc = "Run Log" })
map("n", "<leader>ls", "<cmd> LiveServerStart <cr>", { desc = "Live Server Start" })
map("n", "<leader>lx", "<cmd> LiveServerStop <cr>", { desc = "Live Server Stop" })
map("n", "<leader>lt", "<cmd> LiveServerToggle <cr>", { desc = "Live Server Toggle" })

map("n", "<leader>rs", ":RemoteStart<CR>", {
  desc = "Start Remote SSH",
})
map("n", "<leader>rx", ":RemoteStop<CR>", {
  desc = "Stop Remote SSH",
})
map("n", "<leader>ri", ":RemoteInfo<CR>", {
  desc = "Info Remote SSH",
})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--


-- local viewHex = require("dbee")
-- map('n', '<leader>vh', function()
--   viewHex.open({
--     sources = {
--       {
--         name = "Current SQLite",
--         type = "sqlite",
--         url = vim.fn.expand("%:p"),
--       },
--     },
--   })
-- end, { desc = "View hex" })
