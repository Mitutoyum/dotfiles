local map = vim.keymap.set

-- map("n", "<leader>a", "gg<S-v><S-g>", { desc = "Select all" })

-- Navigate windows
map("n", "<C-h>", "<C-w>h", { desc = "Goto left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Goto lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Goto upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Goto right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Navigate block
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })

map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down", silent = true })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up", silent = true })

-- Indent
map("n", ">", ">>", { desc = "Indent right" })
map("n", "<", "<<", { desc = "Indent left" })

map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })

-- Yanking
map("n", "y", "yy", { desc = "Yank" })

-- No yank-on-delete
map({ "n", "v" }, "d", '"_d', { desc = "Delete" })
map({ "n", "v" }, "D", '"_D', { desc = "Delete" })

map({ "n", "v" }, "s", '"_s', { desc = "Delete" })
map({ "n", "v" }, "S", '"_S', { desc = "Delete" })
