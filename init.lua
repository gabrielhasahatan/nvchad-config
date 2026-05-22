vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("remote-nvim").setup(
  {
    -- Configuration for SSH connections
    ssh_config = {
      ssh_binary = "ssh",                              -- Binary to use for running SSH command
      scp_binary = "scp",                              -- Binary to use for running SSH copy commands
      ssh_config_file_paths = { "$HOME/.ssh/config" }, -- Which files should be considered to contain the ssh host configurations. NOTE: `Include` is respected in the provided files.

      -- These are useful for password-based SSH authentication.
      -- It provides parsing pattern for the plugin to detect that an input is requested.
      -- Each element contains the following attributes:
      -- match - The string to match (plain matching is done)
      -- type - Supports two values "plain"|"secret". Secret means when you provide the value, it should not be stored in the completion history of Neovim.
      -- value - Default value for the prompt
      -- value_type - "static"|"dynamic". For things like password, it would be needed for each new connection that the plugin initiates which could be obtrusive.
      -- So, we save the value (only for current session's interval) to ease the process. If set to "dynamic", we do not save the value even for the session. You have to provide a fresh value each time.
    }
  }
)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"
vim.schedule(function()
  require "mappings"
end)
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
