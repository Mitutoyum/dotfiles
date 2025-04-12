return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Conform",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				end
				return { "isort", "black" }
			end,

			cpp = { "clang-format" },
		},

		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
