return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal

      toggleterm.setup({
        open_mapping = nil,
        direction = "float",
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })

      local function register_floating_binary(name, command, keymap)
        local term = Terminal:new({
          cmd = command,
          hidden = true,
          on_open = function(t)
            vim.cmd("startinsert!")
            -- Allow toggling it off with the same keybind while inside the terminal
            vim.api.nvim_buf_set_keymap(t.bufnr, "t", keymap, "<cmd>close<CR>", { silent = true })
          end,
        })

        vim.keymap.set("n", keymap, function() term:toggle() end, {
          noremap = true,
          silent = true,
          desc = "Toggle " .. name,
        })
      end

      register_floating_binary("JJUI", "jjui", "<leader>jj")
    end,
  },
}

