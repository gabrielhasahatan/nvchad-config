require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#F0F0F0" })
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

vim.lsp.inlay_hint.enable(true)

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
