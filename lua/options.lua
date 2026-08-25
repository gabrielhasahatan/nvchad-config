require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.title = true
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#F0F0F0" })
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

vim.lsp.inlay_hint.enable(false)

require('mini.animate').setup(
  {
    scroll = {
      enable = false,
    },
    -- cursor = {
    --   enable = false,
    -- },
    resize = {
      enable = false,
    },
    open = {
      enable = false,
    },
    close = {
      enable = false,
    }
  }
)

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
  desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function(_)
  local state_path = vim.fn.stdpath("state")
  local log_path = vim.fs.joinpath(state_path, "lsp.log")

  vim.cmd(string.format("edit %s", log_path))
end, {
  desc = "Show LSP log",
})

vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
  desc = "Restart LSP",
})

vim.api.nvim_set_hl(0, "GitsignsCurrentLineBlame", { italic = true })
