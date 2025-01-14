return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					text_align = "left",
					highlight = "Directory",
				},
			},
			diagnostics = "nvim_lsp",
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		local map = vim.keymap.set

		map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
	end,
}
