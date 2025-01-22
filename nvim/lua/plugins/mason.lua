return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	opts = {
		ensure_installed = {
			-- lsp
			"lua-language-server",
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

			-- debuggers
			"debugpy",
		},
	},
	config = function(_, opts)
		require("mason").setup()

		-- installing mason packages normally doesnt work on termux, so i made a workaround
		if string.find(os.getenv("SHELL"):lower(), "termux") then
			local registry = require("mason-registry")

			for _, pkg in pairs(opts.ensure_installed) do
				pkg = registry.get_package(pkg)

				if not pkg:is_installed() then
					pkg:install({
						target = "linux_x64_gnu",
					})
				end
			end
		end

		require("mason-tool-installer").setup({
			ensure_installed = opts.ensure_installed,
		})
	end,
}
