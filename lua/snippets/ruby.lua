local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("sc", {
    t({ "class " }),
    i(1, "MyService"),
    t({ " < ApplicationService", "" }),
    t({ "  def call", "" }),
    t({ "    " }),
    i(0, "# implementation"),
    t({ "", "  end", "end" }),
  }),
}
