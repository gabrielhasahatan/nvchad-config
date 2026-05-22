require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>pc", "<cmd> !pnpm tsc --noEmit <cr>", { desc = "Typescript Check" })
map("n", "<leader>lr", "<cmd> LspRestart <cr>", { desc = "Restart LSP" })
map("n", "<leader>cr", "<cmd> Cppath <cr>", { desc = "Copy File Relative Path" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>rc", function()
  require("remote-ssh").connect()
end, { desc = "Connect SSH" })
map("n", "<leader>ro", function()
  require("remote-ssh").open()
end, { desc = "Open remote file" })
map("n", "<leader>wv", ":vsp<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
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
