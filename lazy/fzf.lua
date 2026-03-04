return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>kf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Fzf Files",
			},
			{
				"<leader>ps",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Fzf Live Grep",
			},
			{
				"<leader>pb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Fzf Buffers",
			},
			{
				"<leader>vh",
				function()
					require("fzf-lua").help_tags()
				end,
				desc = "Fzf Help Tags",
			},
			{
				"<leader>pg",
				function()
					require("fzf-lua").grep_cword()
				end,
				desc = "Fzf Grep Current Word",
			},
			{
				"gr",
				function()
					require("fzf-lua").lsp_references()
				end,
				desc = "Fzf LSP References",
			},
			{
				"<leader>ds",
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				desc = "Fzf LSP Document Symbols",
			},
			{
				"<leader>ws",
				function()
					require("fzf-lua").lsp_workspace_symbols()
				end,
				desc = "Fzf LSP Workspace Symbols",
			},
			{
				"<leader>fd",
				function()
					require("fzf-lua").diagnostics_document()
				end,
				desc = "Fzf LSP Diagnostics",
			},
			{
				"<leader>wd",
				function()
					require("fzf-lua").diagnostics_workspace()
				end,
				desc = "Fzf LSP Workspace Symbols",
			},
		},
		config = function()
			require("fzf-lua").setup({})
		end,
	},
}

