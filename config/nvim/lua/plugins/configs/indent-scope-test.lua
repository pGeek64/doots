local indent = require "mini.indentscope"

local rainbow_hl = {
  "Macro", -- Red
  "StorageClass", -- Yellow
  "@constant.builtin", -- Orange
  "String", -- Green
  "@keyword.conditional", -- Violet
  "Special", -- Cyan
}

-- Convert highlight to hex color dynamically
local function get_fg_color(hl_name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_name })
  if ok and hl.fg then
    return string.format("#%06x", hl.fg)
  else
    return "#ffffff" -- fallback
  end
end

-- Generate array of colors for each indent level
local indent_colors = {}
for _, hl in ipairs(rainbow_hl) do
  table.insert(indent_colors, get_fg_color(hl))
end

indent.setup { -- symbol = "▏",
  draw = {
    delay = 100,
    animation = indent.gen_animation.linear(),
    predicate = function(scope)
      return not scope.body.is_incomplete
    end,
    priority = 2,
    color = function(level)
      return indent_colors[(level - 1) % #indent_colors + 1]
    end,
  },
  mappings = {
    object_scope = "ii",
    object_scope_with_border = "ai",
    goto_top = "[i",
    goto_bottom = "]i",
  },
  options = {
    border = "both",
    indent_at_cursor = true,
    n_lines = 10000,
    try_as_border = true,
  },
  symbol = "│",
}
