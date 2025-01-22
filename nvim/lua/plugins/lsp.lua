return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local opts = {
			-- add lsp options here
			-- example:

			-- lua_ls = {
			-- 	settings = {
			-- 		Lua = {
			-- 			diagnostics = {
			-- 				globals = { "vim" },
			-- 			},
			-- 		},
			-- 	},
			-- },
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local builtin = require("telescope.builtin")

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { desc = desc, buffer = event.buffer })
				end

				map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
				map("gr", builtin.lsp_references, "[G]oto [R]eference")
				map("gi", builtin.lsp_implementations, "[G]oto [I]mplementation")
				map("td", builtin.lsp_type_definitions, "[T]ype [D]efinition")
				map("gD", vim.lsp.buf.definition, "[G]oto [D]eclaration")

				-- map("K", vim.lsp.buf.hover, "Hover") they have this built in idk where

				map("ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("rn", vim.lsp.buf.rename, "[R]e[n]ame")
			end,
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(ls)
					local opt = opts[ls] or {}

					if not opt.capabilities then
						opt.capabilities = default_capabilities
					end

					lspconfig[ls].setup(opt)
				end,
			},
		})
	end,
}
