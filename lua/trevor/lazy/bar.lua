return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_b = {
					{ require("trevor.components.jujutsu").component },
				},
				lualine_c = {'filetype', 'filename'},
				lualine_x = {'diagnostics', 'lsp_status'},
			},
			inactive_sections = {},
		})
	end,
}

