return {
	"esmuellert/codediff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	keys = {
		{ "<leader>cd", ":CodeDiff<CR>", desc = "Open CodeDiff" },
	},
	config = function()
		require("codediff").setup({
			diff = {
				max_computation_time_ms = 1000, -- 1 second
			},
			explorer = {
				visible_groups = {
					staged = false,
				},
			},
		})
	end,
}
