return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module snacks
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		input = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		notifier = { enabled = true },
		indent = {
			indent = { char = "▎" },
			scope = { char = "▎" },
		},
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{
						icon = " ",
						key = "s",
						desc = "Select working directory",
						action = "<CMD>SelectWD<CR>",
					},
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = "<CMD>lua Snacks.dashboard.pick('files')<CR>",
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = "<CMD>lua Snacks.dashboard.pick('live_grep')<CR>",
					},
					-- {
					-- 	icon = " ",
					-- 	key = "F",
					-- 	desc = "Find File Directory",
					-- 	action = "<CMD>Telescope dir find_files<CR>",
					-- },
					-- {
					-- 	icon = " ",
					-- 	key = "G",
					-- 	desc = "Find Text Directory",
					-- 	action = "<CMD>Telescope dir live_grep<CR>",
					-- },
					{
						icon = " ",
						key = "b",
						desc = "File Browser",
						action = "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = "<CMD>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = "<CMD>Lazy<CR>",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = " ",
						key = "t",
						desc = "Terminal",
						action = function()
							require("toggleterm").toggle(nil, nil, nil, vim.g.terminal_direction, nil)
						end,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
