return {
	"danymat/neogen",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	opts = {
		snippet_engine = "luasnip",
	},
	config = function(_, opts)
		local neogen = require("neogen")

		neogen.setup(opts)

		vim.keymap.set("n", "<leader>ng", function()
			neogen.generate()
		end, { desc = "[N]eo [G]enerate" })
	end,
}
