require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>pc", "<cmd> !pnpm tsc --noEmit <cr>", { desc = "Typescript Check" })
map("n", "<leader>lr", "<cmd> LspRestart <cr>", { desc = "Restart LSP" })
map("n", "<leader>cr", "<cmd> Cppath <cr>", { desc = "Copy File Relative Path" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
