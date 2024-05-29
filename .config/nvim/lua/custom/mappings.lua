local M = {}
M.hardtime = {
  plugin = true,
  n = {
    ["<leader>ht"] = {"<cmd> Hardtime toggle <CR>", "Hardtime toggle"},
    ["<leader>he"] = {"<cmd> Hardtime enable <CR>", "Hardtime enable"},
    ["<leader>hd"] = {"<cmd> Hardtime disable <CR>", "Hardtime disable"},
    ["<leader>hr"] = {"<cmd> Hardtime report <CR>", "Hardtime report"},
  },
  -- v = {
  --   ["<leader>ht"] = {"Hardtime toggle", "Hardtime toggle"},
  --   ["<leader>he"] = {"Hardtime toggle", "Hardtime enable"},
  --   ["<leader>hd"] = {"Hardtime toggle", "Hardtime disable"},
  --   ["<leader>hr"] = {"Hardtime toggle", "Hardtime report"},
  -- }
}
return M


-- -- create a new mapping for Hardtime plugin
-- M.hardtime = {
--   plugin = true,
--   n = {
--     ["<leader>ht"] = {"Hardtime toggle", "Hardtime toggle"},
--     ["<leader>he"] = {"Hardtime toggle", "Hardtime enable"},
--     ["<leader>hd"] = {"Hardtime toggle", "Hardtime disable"},
--     ["<leader>hr"] = {"Hardtime toggle", "Hardtime report"},
--   },
--   v = {
--     ["<leader>ht"] = {"Hardtime toggle", "Hardtime toggle"},
--     ["<leader>he"] = {"Hardtime toggle", "Hardtime enable"},
--     ["<leader>hd"] = {"Hardtime toggle", "Hardtime disable"},
--     ["<leader>hr"] = {"Hardtime toggle", "Hardtime report"},
--   }
-- }