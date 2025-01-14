local onedark = {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local onedark = require("onedark")
		onedark.setup({
			style = "warmer",
		})
		onedark.load()
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- flavour = ''
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}

local onedarkpro = {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("onedark")
	end,
}

return catppuccin
