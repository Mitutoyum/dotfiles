return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		local opts = {
			-- lua_ls = {
			-- 	settings = {
			-- 		Lua = {
			-- 			diagnostics = {
			-- 				globals = { "vim" },
			-- 			},
			-- 		},
			-- 	},
			-- },

			-- clangd = {
			-- 	settings = {
			-- 		CompileFlags = {
			-- 			Add = { "--target=x86_64-w64-windows-gnu" },
			-- 		},
			-- 	},
			-- },
		}

		vim.api.nvim_create_autocmd("LspAttach", {

			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local builtin = require("telescope.builtin")

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { desc = desc, buffer = event.buffer })
				end

				map("gd", builtin.lsp_definitions, "Goto Definition")
				map("gr", builtin.lsp_references, "Goto Reference")
				map("gI", builtin.lsp_implementations, "Goto Implementation")
				map("gy", builtin.lsp_type_definitions, "Goto Type Definition")
				map("gD", vim.lsp.buf.definition, "Goto Declaration")

				-- map("K", vim.lsp.buf.hover, "Hover")
				map("gK", vim.lsp.buf.signature_help, "Signature Help")

				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>cl", vim.lsp.codelens.run, "Code Lens")

				map("<leader>rn", vim.lsp.buf.rename, "Rename")

				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle Inlay Hints")
				end

				vim.diagnostic.config({
					virtual_text = true,
				})
			end,
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(ls)
					local opt = opts[ls] or {}

					-- if not opt.capabilities then
					-- 	opt.capabilities = capabilities
					-- end
					opt.capabilities = vim.tbl_deep_extend("force", {}, capabilities, ls.capabilities or {})

					lspconfig[ls].setup(opt)
				end,
			},
		})
	end,
}
