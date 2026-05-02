-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  hl_override = {
    Comment      = { italic = true, bg = "#1f2335", fg = "#4E9F3D" },
    ["@comment"] = { italic = true },
    Tabline      = { bg = 'NONE' },
    LspInlayHint = { bg = 'NONE' },
    Visual       = { italic = true, },
    IblChar      = { fg = "#5C6370" }, -- garis indent biasa, lebih terang
    IblScope     = { fg = "#7199ee" },

  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  theme = "tokyodark",
  transparency = true,
  statusline = {
    theme = "default",
    separator_style = "round"
  },
  tabufline = {
    order = { "treeOffset", "buffers" },
  },
}

M.lsp = {
  signature = false,
}

return M
