return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		shade_terminals = false,
		direction = vim.g.terminal_direction,
	},
	config = function(_, opts)
		local toggleterm = require("toggleterm")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local dropdown = require("telescope.themes").get_dropdown()
		local directions = {
			"float",
			"horizontal",
			"vertical",
			"tab",
		}

		local direction_picker = function(opts)
			opts = opts or {}
			pickers
				.new(opts, {
					prompt_title = "Terminal Direction",
					finder = finders.new_table({
						results = directions,
					}),
					sorter = conf.generic_sorter(opts),
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							vim.g.terminal_direction = selection[1]
						end)
						return true
					end,
				})
				:find()
		end

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		vim.keymap.set("n", "<leader>sd", function()
			direction_picker(dropdown)
		end, { desc = "[S]witch terminal [d]irection" })

		vim.keymap.set("n", "<leader>tt", function()
			toggleterm.toggle(nil, nil, nil, vim.g.terminal_direction, nil)
		end, { desc = "[T]oggle [T]erminal" })

		vim.keymap.set({ "n", "t" }, "<C-t>", function()
			toggleterm.toggle(nil, nil, nil, vim.g.terminal_direction, nil)
		end, { desc = "Toggle [T]erminal" })

		toggleterm.setup(opts)
	end,
}
