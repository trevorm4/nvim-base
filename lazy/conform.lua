return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			go = { "gofmt" },
			nix = { "nixfmt" },
			python = { "black" },
			rust = { "rustfmt" },
			tf = { "terraform_fmt" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "-style=file", "-fallback-style=LLVM" },
			},
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
