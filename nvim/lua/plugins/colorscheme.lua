local onedark = {
	"navarasu/onedark.nvim",
	priority = 1000,
	opts = {
		-- style = "",
	},
	config = function(_, opts)
		local onedark = require("onedark")
		onedark.setup(opts)
		onedark.load()
	end,
}

local onedarkpro = {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("onedark")
	end,
}
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
	priority = 1000,
	config = function()
		require("gruvbox").setup({
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
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	end,
}

return gruvbox
