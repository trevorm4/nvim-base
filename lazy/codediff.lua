return {
	"esmuellert/codediff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	keys = {
		{ "<leader>cd", ":CodeDiff<CR>", desc = "Open CodeDiff" },
	},
	config = function()
		require("codediff").setup({})
	end,
}
