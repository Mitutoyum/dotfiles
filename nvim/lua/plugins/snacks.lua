return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module snacks
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = {
			enabled = true,
			indent = { char = "▎" },
			scope = { char = "▎" },
		},
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
	},
}
