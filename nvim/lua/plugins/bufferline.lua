return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
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
	config = function(_, opts)
		require("bufferline").setup(opts)

		vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
	end,
}
