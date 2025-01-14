return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		local conform = require("conform")

		conform.setup({
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
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format({ lsp_format = "fallback", async = true })
		end, { desc = "[M]ake [P]retty" })
	end,
}
