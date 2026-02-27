local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

local function open_win_config_func()
	local screen_w = vim.opt.columns:get()
	local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
	local window_w = screen_w * WIDTH_RATIO
	local window_h = screen_h * HEIGHT_RATIO
	local window_w_int = math.floor(window_w)
	local window_h_int = math.floor(window_h)
	local center_x = (screen_w - window_w) / 2
	local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
	return {
		border = "rounded",
		relative = "editor",
		row = center_y,
		col = center_x,
		width = window_w_int,
		height = window_h_int,
	}
end

local function nvim_tree_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	local function change_root_to_node(node)
		if node == nil then
			node = api.tree.get_node_under_cursor()
		end

		if node ~= nil and node.type == "directory" then
			vim.api.nvim_set_current_dir(node.absolute_path)
		end
		api.tree.change_root_to_node(node)
	end

	local function change_root_to_parent(node)
		local abs_path
		if node == nil then
			abs_path = api.tree.get_nodes().absolute_path
		else
			abs_path = node.absolute_path
		end

		local parent_path = vim.fs.dirname(abs_path)
		vim.api.nvim_set_current_dir(parent_path)
		api.tree.change_root(parent_path)
	end

	vim.keymap.set("n", "<C-]>", change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<2-RightMouse>", change_root_to_node, opts("CD"))
	vim.keymap.set("n", "-", change_root_to_parent, opts("Up"))
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			hijack_cursor = true,
			on_attach = nvim_tree_on_attach,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = { "help" },
			},
			git = {
				enable = false,
			},
			renderer = {
				icons = {
					show = {
						git = false,
					},
				},
			},
			diagnostics = {
				enable = false,
			},
			filters = {
				custom = {
					"^.git$",
				},
				git_ignored = false,
			},
			view = {
				float = {
					enable = true,
					open_win_config = open_win_config_func,
				},
			},
			actions = {
				change_dir = {
					enable = false,
					restrict_above_cwd = true,
				},
				open_file = {
					resize_window = true,
					window_picker = {
						chars = "aoeui",
					},
				},
				remove_file = {
					close_window = false,
				},
			},
			log = {
				enable = false,
				truncate = true,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})
	end,
}
