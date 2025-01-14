local nvimtree = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local tree = require("nvim-tree")
		local api = require("nvim-tree.api")

		tree.setup({
			disable_netrw = true,

			on_attach = api.config.mappings.default_on_attach,

			filters = {
				dotfiles = false,
			},
		})

		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		map("<leader>fe", api.tree.toggle, "[F]ile [E]xplorer")
	end,
}

local neotree = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		popup_border_style = "rounded",
		source_selector = {
			winbar = true,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_hidden = false,
			},
		},
	},
	config = function(_, opts)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		local neotree = require("neo-tree")
		local command = require("neo-tree.command")

		neotree.setup(opts)

		map("<leader>fe", function()
			command.execute({ toggle = true })
		end, "[F]ile [E]xplorer")

		map("<leader>ge", function()
			command.execute({ source = "git_status", toggle = true })
		end, "[G]it [E]xplorer")

		map("<leader>be", function()
			command.execute({ source = "buffers", toggle = true })
		end, "[B]uffer [E]xplorer")
	end,
}

return neotree
