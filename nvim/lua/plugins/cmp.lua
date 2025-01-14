return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-path",

		"chrisgrieser/cmp-nerdfont",
		"saadparwaiz1/cmp_luasnip",
		"andersevenrud/cmp-tmux",
		"ray-x/cmp-treesitter",

		"L3MON4D3/LuaSnip",
		"folke/lazydev.nvim",
		"onsails/lspkind.nvim", -- for icons
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			enabled = function() -- dont complete comments
				local context = require("cmp.config.context")
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "lazydev" },

				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },

				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "treesitter" },
				{ name = "emoji" },
				{ name = "nerdfont" },
				{ name = "tmux" },
			}),

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up

				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),

				["<Tab>"] = cmp.mapping.select_next_item(),

				["<S-Tab>"] = cmp.mapping.select_prev_item(),

				["<C-Space>"] = cmp.mapping.complete({}),
			}),

			formatting = {
				format = lspkind.cmp_format({}),
			},

			experimental = {
				ghost_text = true,
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}
