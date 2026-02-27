require("trevor.set")
require("trevor.remap")
require("trevor.lazy_init")

local augroup = vim.api.nvim_create_augroup
local group = augroup("Trevor", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.o.autoread = true

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.colorcolumn = ""
vim.cmd.colorscheme("sonokai")

-- Support optional work module for non-plugin config
pcall(require, "work")
