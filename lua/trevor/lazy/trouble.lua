return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle("diagnostics")
			end)

			vim.keymap.set("n", "<leader>tq", function()
				require("trouble").toggle("quickfix")
			end)
		end,
	},
}
