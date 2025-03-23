local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = false,
		style = "",
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}

local gruvbox = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_tabline = false,
		invert_signs = false,
		invert_intend_guides = false,
		inverse = false, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	end,
}

return gruvbox
