local map = vim.keymap.set

return {
	{
		"nvim-mini/mini.nvim",
		version = false,

		config = function()
			require("mini.starter").setup({
				query_updaters = "",
			})
		end,
	},
}
