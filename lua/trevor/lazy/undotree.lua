return {
	dir = vim.env.VIMRUNTIME .. "/pack/dist/opt/nvim.undotree",
	name = "undotree",
	keys = {
		{ "<leader>u", function() require("undotree").open() end, desc = "Toggle undotree" },
	},
}
