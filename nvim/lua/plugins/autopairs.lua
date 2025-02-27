return {
	"windwp/nvim-autopairs",
	dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
	event = "InsertEnter",
	opts = {
		check_ts = true,
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)

		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
