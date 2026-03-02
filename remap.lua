local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>rt", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>zig", "<cmd>LspRestart<cr>")
map({ "n", "x", "o" }, "<leader>;", ";", { desc = "Repeat f/t forward" })
map({ "n", "x", "o" }, "<leader>,", ",", { desc = "Repeat f/t backward" })
-- paste
map("x", "<leader>p", [["_dP]])

-- yank to clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>dg", "ggdG")
-- delete and send to null register
map({ "n", "v" }, "<leader>d", '"_d')

map("i", "<C-c>", "<Esc>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
map("n", "<leader>ay", "<cmd>1,$y+<CR>", { desc = "Yank whole file to system clipboard" })
map("n", "<leader>da", "<cmd>:%d<CR>", { desc = "Delete all lines in buffer" })

--- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>cl", ":TermSelect<CR>") -- List and select terminals
