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
			"<leader>bd",
			"<cmd>bd<CR>",
			desc = "[B]uffer [D]elete",
		},

		{
			"<leader>bco",
			"<cmd>BufferLineCloseOthers<CR>",
			desc = "[B]uffer [C]lose [O]thers",
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
			},
			diagnostics = "nvim_lsp",
			numbers = "buffer_id",
		},
	},
}
