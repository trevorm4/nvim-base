return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local map = vim.keymap.set
			map("n", "<leader>pf", function()
				require("fzf-lua").files()
			end, { desc = "Fzf Files" })
			map("n", "<leader>kf", function()
				require("fzf-lua").git_files()
			end, { desc = "Fzf Git Files" })
			map("n", "<leader>ps", function()
				require("fzf-lua").live_grep()
			end, { desc = "Fzf Live Grep" })
			map("n", "<leader>pb", function()
				require("fzf-lua").buffers()
			end, { desc = "Fzf Buffers" })
			map("n", "<leader>vh", function()
				require("fzf-lua").help_tags()
			end, { desc = "Fzf Help Tags" })
			map("n", "<leader>pg", function()
				require("fzf-lua").grep_cword()
			end, { desc = "Fzf Grep Current Word" })
			map("n", "<leader>gc", function()
				require("fzf-lua").git_commits()
			end, { desc = "Fzf Git Commits" })
			map("n", "<leader>gs", function()
				require("fzf-lua").git_status()
			end, { desc = "Fzf Git Status" })
			map("n", "<leader>gb", function()
				require("fzf-lua").git_branches()
			end, { desc = "Fzf Git Branches" })
			map("n", "gr", function()
				require("fzf-lua").lsp_references()
			end, { desc = "Fzf LSP References" })
			map("n", "gi", function()
				require("fzf-lua").lsp_implementations()
			end, { desc = "Fzf LSP Implementations" })
			map("n", "<leader>ds", function()
				require("fzf-lua").lsp_document_symbols()
			end, { desc = "Fzf LSP Document Symbols" })
			map("n", "<leader>ws", function()
				require("fzf-lua").lsp_workspace_symbols()
			end, { desc = "Fzf LSP Workspace Symbols" })
		end,
	},
}
