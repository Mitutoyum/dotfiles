return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ async = true })
			end,
			desc = "[M]ake [P]retty",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,

			cpp = { "clang-format" },
		},

		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
