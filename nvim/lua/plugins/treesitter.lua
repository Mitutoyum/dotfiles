return {
	"nvim-treesitter/nvim-treesitter",
	verson = false,
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		-- ensure_installed = {
		-- 	"lua",
		-- 	"luadoc",
		-- 	"vim",
		-- 	"vimdoc",
		-- 	"query",
		-- 	"json",
		-- 	"c",
		-- 	"cpp",
		-- 	"cmake",
		-- 	"python",
		-- 	"markdown",
		-- 	"markdown_inline",
		-- },
		-- sync_install = true, -- for low-end devices

		ensure_installed = "all",
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
