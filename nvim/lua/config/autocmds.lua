vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("yank_highlight", { clear = true }),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})
