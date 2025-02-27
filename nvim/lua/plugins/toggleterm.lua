return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-t>]],
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
			{ "float", "󰉧" },
			{ "horizontal", "" },
			{ "vertical", "" },
			{ "tab", "󰓩" },
		}

		local direction_picker = function(opts)
			opts = opts or {}
			pickers
				.new(opts, {
					prompt_title = "Terminal Direction",
					finder = finders.new_table({
						results = directions,
						entry_maker = function(entry)
							local direction, icon = entry[1], entry[2]
							return {
								value = entry,
								display = icon .. " " .. direction,
								ordinal = direction,
							}
						end,
					}),
					sorter = conf.generic_sorter(opts),
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							if not selection then
								return
							end
							vim.g.terminal_direction = selection.value[1]
						end)
						return true
					end,
				})
				:find()
		end

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-[", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

			vim.keymap.set("t", "<S-Space>", "<Space>", opts)

			vim.keymap.set("t", "<S-Enter>", "<Enter>", opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		vim.keymap.set("n", "<leader>tsd", function()
			direction_picker(dropdown)
		end, { desc = "Switch terminal direction" })

		vim.keymap.set("n", "<leader>tt", function()
			toggleterm.toggle(nil, nil, nil, vim.g.terminal_direction, nil)
		end, { desc = "Toggle terminal" })

		vim.keymap.set({ "n", "t" }, "<C-\\>", function()
			toggleterm.toggle(nil, nil, nil, vim.g.terminal_direction, nil)
		end, { desc = "Toggle Terminal" })

		toggleterm.setup(opts)
	end,
}
