local indent = require "mini.indentscope"

indent.setup { -- symbol = "▏",
  draw = {
    delay = 10, -- delay in ms before drawing scope indicator
    animation = indent.gen_animation.linear(), -- keeps animation
    predicate = function(scope)
      return not scope.body.is_incomplete
    end,
    priority = 2,
  },
  -- Key mappings for motions and text objects
  mappings = {
    object_scope = "ii",
    object_scope_with_border = "ai",
    goto_top = "[i",
    goto_bottom = "]i",
  },
  -- Scope computation options
  options = {
    border = "both",
    indent_at_cursor = true,
    n_lines = 10000,
    try_as_border = true,
  },

  -- Character to draw for the scope indicator
  symbol = "│",
  symbol_highlight = "Title",
}

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "Directory" })
