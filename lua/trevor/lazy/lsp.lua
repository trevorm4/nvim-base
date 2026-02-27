return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"j-hui/fidget.nvim",
		"ray-x/go.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		servers = {
			gopls = {},
			rust_analyzer = {},
			ts_ls = {},
			oxlint = {
				filetypes = {
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							},
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("conform").setup({
			formatters_by_ft = {},
		})
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Modern LspAttach autocommand for keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts_attach = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts_attach)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover({ border = "rounded" })
				end, opts_attach)
				vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts_attach)
				vim.keymap.set("n", "<leader>dn", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, opts_attach)
				vim.keymap.set("n", "<leader>dp", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, opts_attach)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts_attach)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts_attach)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts_attach)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help({ border = "rounded" })
				end, opts_attach)
			end,
		})

		require("fidget").setup({})
		require("mason").setup()
		require("go").setup()

		-- Configure servers from opts
		for server_name, server_config in pairs(opts.servers or {}) do
			server_config.capabilities = vim.tbl_deep_extend("force", capabilities, server_config.capabilities or {})
			vim.lsp.config(server_name, server_config)
			vim.lsp.enable(server_name)
		end

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})
	end,
}
