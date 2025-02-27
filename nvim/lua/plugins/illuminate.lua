return {
	"RRethy/vim-illuminate",
	opts = {},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
