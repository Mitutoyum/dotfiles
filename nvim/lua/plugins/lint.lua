return {
	"mfussenegger/nvim-lint",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			-- python = { "pylint" },
			-- ...
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		vim.api.nvim_create_autocmd(opts.events, {
			group = vim.api.nvim_create_augroup("lint_augroup", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
