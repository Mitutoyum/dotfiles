return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{
			"]b",
			"<cmd>BufferLineCycleNext<CR>",
			desc = "Next Buffer",
		},
		{
			"[b",
			"<cmd>BufferLineCyclePrev<CR>",
			desc = "Previous Buffer",
		},

		{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },

		{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },

		{
			"<Tab>",
			"<cmd>BufferLineCycleNext<CR>",
			desc = "Next Buffer",
		},
		{
			"<S-Tab>",
			"<cmd>BufferLineCyclePrev<CR>",
			desc = "Previous Buffer",
		},

		{
			"<leader>bco",
			"<cmd>BufferLineCloseOthers<CR>",
			desc = "Close Others",
		},

		{
			"<leader>bp",
			"<Cmd>BufferLineTogglePin<CR>",
			desc = "Toggle Pin",
		},

		{
			"<leader>bP",
			"<Cmd>BufferLineGroupClose ungrouped<CR>",
			desc = "Delete Non-Pinned Buffers",
		},

		{
			"<leader>br",
			"<Cmd>BufferLineCloseRight<CR>",
			desc = "Delete Buffers to the Right",
		},

		{
			"<leader>bl",
			"<Cmd>BufferLineCloseLeft<CR>",
			desc = "Delete Buffers to the Left",
		},
	},
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "NeoTree",
					text_align = "left",
					separator = true,
				},
				{
					filetype = "snacks_layout_box",
				},
			},
			always_show_bufferline = false,
			diagnostics = "nvim_lsp",
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
			right_mouse_command = function(n)
				Snacks.bufdelete(n)
			end,
		},
	},
}
