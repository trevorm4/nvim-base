local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local spec = {
    { import = "trevor.lazy" },
}

-- Check for optional work plugins
local ok, _ = pcall(require, "work.lazy")
if ok then
    table.insert(spec, { import = "work.lazy" })
end

require("lazy").setup({
    spec = spec,
    change_detection = { notify = false }
})
