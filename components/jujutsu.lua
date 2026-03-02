-- Jujutsu component for lualine
-- Shows change ID and bookmark for current buffer's jj repository
-- Optimized with asynchronous calls to avoid blocking the UI

local M = {}

local state = {
	is_jj = false,
	change_id = nil,
	bookmark = nil,
	last_update = 0,
	updating = false,
	last_cwd = nil,
}

-- Function to update state asynchronously
local function update_state(cwd)
	if state.updating then
		return
	end
	state.updating = true
	state.last_cwd = cwd

	-- Check jj root first
	vim.system({ "jj", "root" }, { cwd = cwd, text = true }, function(obj)
		if obj.code ~= 0 then
			vim.schedule(function()
				state.is_jj = false
				state.updating = false
				state.last_update = os.time()
			end)
			return
		end

		-- Get change ID and bookmark in parallel
		local results = { change_id = nil, bookmark = nil }
		local completed = 0

		local function check_done()
			completed = completed + 1
			if completed == 2 then
				vim.schedule(function()
					state.is_jj = true
					state.change_id = results.change_id
					state.bookmark = results.bookmark
					state.updating = false
					state.last_update = os.time()
				end)
			end
		end

		vim.system({ "jj", "log", "-r", "@", "--no-graph", "-T", "change_id.shortest()" }, { cwd = cwd, text = true }, function(o)
			if o.code == 0 then
				results.change_id = o.stdout:match("^%s*(.-)%s*$")
			end
			check_done()
		end)

		vim.system({ "jj", "log", "-r", "@", "--no-graph", "-T", "bookmarks" }, { cwd = cwd, text = true }, function(o)
			if o.code == 0 then
				results.bookmark = o.stdout:match("^%s*(.-)%s*$")
			end
			check_done()
		end)
	end)
end

-- Main component function
function M.component()
	-- Get current buffer's directory
	local bufpath = vim.api.nvim_buf_get_name(0)
	local cwd

	if bufpath ~= "" and vim.fn.filereadable(bufpath) == 1 then
		cwd = vim.fs.dirname(bufpath)
	else
		cwd = vim.fn.getcwd()
	end

	-- Update state if needed (every 10 seconds or if CWD changed)
	local now = os.time()
	if now - state.last_update > 10 or cwd ~= state.last_cwd then
		update_state(cwd)
	end

	if not state.is_jj then
		return ""
	end

	-- Build display string from current state
	local parts = {}

	if state.change_id and state.change_id ~= "" then
		table.insert(parts, state.change_id)
	end

	if state.bookmark and state.bookmark ~= "" then
		table.insert(parts, "(" .. state.bookmark .. ")")
	end

	if #parts == 0 then
		-- Even if we don't have ID/bookmark, if we know it's a jj repo, show the icon
		return " (jj)"
	end

	return " " .. table.concat(parts, " ")
end

return M
