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
