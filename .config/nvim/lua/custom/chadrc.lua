---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'radium' ,
  -- nvdash = {
  --   load_on_startup = true,
  --   buttons = {
  --     { "  Find File", "Spc f f", "Telescope find_files" },
  --     { "  Recently Used Files", "Spc f r", "Telescope oldfiles" },
  --     { "  Find Word", "Spc f w", "Telescope live_grep" },
  --     { "  Bookmarks", "Spc b m", "Telescope marks" },
  --     { "  Installed Plugins", "Spc p p", "Lazy" }
  --   }
  -- }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
