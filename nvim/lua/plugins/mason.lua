return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	opts = {
		ensure_installed = {
			-- lsp
			"lua_ls",
			"pyright",
			"clangd",

			-- formatters
			"stylua",
			"ruff",
			"isort",
			"black",
			"clang-format",

			-- linters
			"pylint",
		},
	},
	config = function(_, opts)
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = opts.ensure_installed,
		})
	end,
}
