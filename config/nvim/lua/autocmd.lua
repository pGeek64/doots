local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.ms",
  callback = function()
    local file = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r") .. ".pdf"
    local cmd = "groff -ms " .. file .. " -T pdf -tle > " .. output
    vim.fn.jobstart({ "sh", "-c", cmd }, { detach = true })
  end,
})

autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local first_line = vim.fn.getline(1)
    if first_line:match("^#!.*[/ ]bash") or first_line:match("^#!.*[/ ]sh") then
      local file = vim.fn.expand("%:p")
      vim.fn.system({ "chmod", "+x", file })
      -- vim.notify("Made " .. file .. " executable", vim.log.levels.INFO) comment if want silent
    end
  end,
})
