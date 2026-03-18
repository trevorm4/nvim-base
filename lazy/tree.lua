return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
		default_file_explorer = true,
		columns = {
			"icon",
		},
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		-- Send deleted files to the trash instead of permanently deleting them
		delete_to_trash = false,
		-- Skip the confirmation popup for simple operations
		skip_confirm_for_simple_edits = true,
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = false,
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, ".")
			end,
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
			["<Esc>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["<C-]>"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
			["gy"] = {
				callback = function()
					local entry = require("oil").get_cursor_entry()
					local dir = require("oil").get_current_dir()
					if entry and dir then
						local path = vim.fs.joinpath(dir, entry.name)
						vim.fn.setreg("+", path)
						vim.notify("Copied " .. path .. " to clipboard")
					end
				end,
				desc = "Copy absolute path",
			},
		},
	},
	init = function()
		-- Helper to toggle oil in current window
		local function toggle_oil()
			if vim.bo.filetype == "oil" then
				require("oil").close()
			else
				require("oil").open()
			end
		end

		vim.keymap.set("n", "<leader>e", toggle_oil, { desc = "Toggle Oil explorer" })
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
