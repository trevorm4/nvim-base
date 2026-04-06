return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local function toggle_fzf(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("fzf-lua").fzf_exec(file_paths, {
				prompt = "Harpoon> ",
				actions = {
					["default"] = function(selected)
						if selected then
							vim.cmd("edit " .. selected[1])
						end
					end,
				},
			})
		end

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			toggle_fzf(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
	end,
}
