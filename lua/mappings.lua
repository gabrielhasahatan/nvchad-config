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
