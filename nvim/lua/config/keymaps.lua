local map = vim.keymap.set

-- Navigate windows
map("n", "<C-h>", "<C-w>h", { desc = "Goto left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Goto lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Goto upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Goto right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

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

-- Terminal
map("t", "<esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-[", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Yanking / Pasting
map("n", "y", "yy", { desc = "Yank" })
