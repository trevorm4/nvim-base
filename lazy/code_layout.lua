return {
	{
		"trevorm4/code-layout.nvim",
		branch = "dev",
		keys = {
			{
				"<leader>o",
				"<cmd>CodeLayoutRight<cr>",
				desc = "Open LSP symbol tree",
			},
			{
				"<leader>lf",
				"<cmd>CodeLayoutFloat<cr>",
				desc = "Open floating layout window",
			},
		},
		config = function()
			require("code_layout").setup({
				floating = {
					annotate = true, -- Set to false to hide the full symbol path in the fzf window
				},
			})
		end,
	}
}
