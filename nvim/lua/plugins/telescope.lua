return {
	"nvim-telescope/telescope.nvim",
	-- lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",

		{
			"princejoogie/dir-telescope.nvim",
			opts = {
				hidden = false,
			},
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	-- keys = {
	-- 	{
	-- 		"<leader>ff",
	-- 		require("telescope.builtin").find_files,
	-- 		desc = "Telescope find files",
	-- 	},
	-- 	{
	-- 		"<leader>fF",
	-- 		require("telescope").extensions.dir.find_files,
	-- 		desc = "Telescope find files directory",
	-- 	},
	-- 	{
	-- 		"<leader>fg",
	-- 		require("telescope.builtin").live_grep,
	-- 		desc = "Telescope live grep",
	-- 	},
	--
	-- 	{
	-- 		"<leader>fG",
	-- 		require("telescope").extensions.dir.live_grep,
	-- 		desc = "Telescope live grep directory",
	-- 	},
	-- 	{
	-- 		"<leader>fb",
	-- 		require("telescope.builtin").buffers,
	-- 		desc = "Telescope buffers",
	-- 	},
	-- 	{
	-- 		"<leader>fB",
	-- 		require("telescope").extensions.file_browser,
	-- 		desc = "Telescope file browser",
	-- 	},
	-- },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- dont preview binary files
		local action_layout = require("telescope.actions.layout")
		local previewers = require("telescope.previewers")
		local Job = require("plenary.job")
		local new_maker = function(filepath, bufnr, opts)
			filepath = vim.fn.expand(filepath)
			Job:new({
				command = "file",
				args = { "--mime-type", "-b", filepath },
				on_exit = function(j)
					local mime_type = vim.split(j:result()[1], "/")[1]
					if mime_type == "text" then
						previewers.buffer_previewer_maker(filepath, bufnr, opts)
					end
				end,
			}):sync()
		end
		--\\

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "ignore_case",
			},
			defaults = {
				buffer_previewer_maker = new_maker,
				preview = false,
				mappings = {
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)

							-- Depending on what you want put `cd`, `lcd`, `tcd`
							-- vim.cmd(string.format("silent lcd %s", dir))

							vim.api.nvim_set_current_dir(dir)
						end,

						["<leader>tp"] = action_layout.toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { ".git" },
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("dir")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set(
			"n",
			"<leader>fF",
			telescope.extensions.dir.find_files,
			{ desc = "Telescope find files directory" }
		)

		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set(
			"n",
			"<leader>fG",
			telescope.extensions.dir.live_grep,
			{ desc = "Telescope live grep directory" }
		)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fn", "<CMD>Telescope notify<CR>", { desc = "Telescope find notifications" })

		vim.keymap.set(
			"n",
			"<leader>fB",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Telescope file browser" }
		)

		vim.api.nvim_create_user_command("SelectWD", function()
			local get_dirs = require("dir-telescope.util").get_dirs
			local settings = require("dir-telescope.settings").current

			get_dirs(settings, function(opts)
				vim.api.nvim_set_current_dir(opts.search_dirs[1])
			end)
		end, { desc = "Select working directory" })
	end,
}
