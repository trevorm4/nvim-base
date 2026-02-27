return {
	"swaits/lazyjj.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("lazyjj").setup({
			mapping = "<leader>jj",
		})
	end,
}
