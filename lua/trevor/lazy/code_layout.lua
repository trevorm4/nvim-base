return {
  {
    "trevorm4/code-layout.nvim",
    keys = {
      {
        "<leader>o",
        "<cmd>CodeLayoutRight<cr>",
        desc = "Open LSP symbol tree",
      },
      {
        "<leader>lf",
        "<cmd>CodeLayoutFloat<cr>",
        desc = "Open floating layout window",
      },
    },
    config = function()
      -- Plugin logic is handled via the layout() API
    end,
  },
}
