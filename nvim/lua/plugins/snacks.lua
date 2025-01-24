local function term_nav(dir)
	---@param self snacks.terminal
	return function(self)
		return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
			vim.cmd.wincmd(dir)
		end)
	end
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module snacks
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		input = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		notifier = { enabled = true },
		indent = {
			indent = { char = "▎" },
			scope = { char = "▎" },
		},
		terminal = {
			win = {
				keys = {
					nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
					nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
					nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
					nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
				},
			},
		},
	},
}
