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

			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
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

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(ls)
					local opt = opts[ls] or {}

					if not opt.capabilities then
						opt.capabilities = capabilities
					end

					lspconfig[ls].setup(opt)
				end,
			},
		})
	end,
}
