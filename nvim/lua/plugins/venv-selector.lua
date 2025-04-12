return {
	"linux-cultist/venv-selector.nvim",
	branch = "regexp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
	},
	opts = {},
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
}
